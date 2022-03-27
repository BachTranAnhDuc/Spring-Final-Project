package com.rubikme.admin.product.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rubikme.admin.FileUploadUtil;
import com.rubikme.admin.brand.BrandService;
import com.rubikme.admin.product.ProductNotFoundException;
import com.rubikme.admin.product.ProductService;
import com.rubikme.common.entity.Brand;
import com.rubikme.common.entity.Product;
import com.rubikme.common.entity.ProductImage;

@Controller
public class ProductController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BrandService brandService;
	
	@GetMapping("/products")
	public String listAll(Model model) {
		
		List<Product> listProducts = productService.listAll();
		
		model.addAttribute("listProducts", listProducts);
		
		return "products/products";
	}
	
	@GetMapping("/products/new")
	public String newProduct(Model model) {
		
		List<Brand> listBrands = brandService.listAll();
		
		Product product = new Product();
		
		product.setEnabled(true);
		product.setInStock(true);
		
		model.addAttribute("product", product);
		model.addAttribute("listBrands", listBrands);
		model.addAttribute("pageTitle", "Create New Product");
		model.addAttribute("numberOfExistingExtraImages", 0);
		
		return "products/product_form";
	}
	
	@PostMapping("/products/save")
	public String saveProduct(Product product,
				RedirectAttributes re,
				@RequestParam("fileImage") MultipartFile mainMultipartFile,
				@RequestParam("extraImage") MultipartFile[] extraImageMul,
				@RequestParam(name = "detailIds", required = false) String[] detailIds,
				@RequestParam(name = "detailNames", required = false) String[] detailNames,
				@RequestParam(name = "detailValues", required = false) String[] detailValues,
				@RequestParam(name = "imageIds", required = false) String[] imageIds,
				@RequestParam(name = "imageNames", required = false) String[] imageNames)
						throws IOException {
		
//		System.out.println("Product Name: " + product.getName());
//		System.out.println("Brand ID: " + product.getBrand().getId());
//		System.out.println("Category ID: " + product.getCategory().getId());
		
		setMainImageName(mainMultipartFile, product);
		setExistingExtraImageNames(imageIds, imageNames, product);
		setNewExtraImageNames(extraImageMul, product);
		setProductDetails(detailIds, detailNames, detailValues, product);
			
		Product saveProduct = productService.save(product);
		
		saveUploadImages(mainMultipartFile, extraImageMul, saveProduct);
		
		
		deleteExtraImagesRemovedOnForm(product);
		
		
		re.addFlashAttribute("message", "The product has been saved successfully!");
		
		return "redirect:/products";
	}
	
	private void deleteExtraImagesRemovedOnForm(Product product) {
		// TODO Auto-generated method stub
		
		String extraImageDir = "../product-images/" + product.getId() + "/extras";
		Path dirPath = Paths.get(extraImageDir);
		
		try {
			Files.list(dirPath).forEach(file -> {
				String filename = file.toFile().getName();
				
				if (!product.containsImageName(filename)) {
					try {
						Files.delete(file);
						LOGGER.info("Deleted extra image: " + filename);
						
					} catch (IOException e) {
						LOGGER.error("Could not delete extra image: " + filename);
					}
				}
				
			});
		} catch (IOException ex) {
			LOGGER.error("Could not list directory: " + dirPath);
		}
	}

	private void setExistingExtraImageNames(String[] imageIds, String[] imageNames, Product product) {
		// TODO Auto-generated method stub
		if (imageIds == null || imageIds.length == 0) return;
		
		Set<ProductImage> images = new HashSet<>();
		
		for (int count = 0; count < imageIds.length; count++) {
			Integer id = Integer.parseInt(imageIds[count]);
			String name = imageNames[count];
			
			images.add(new ProductImage(id, name, product));
		}
		
		product.setImages(images);
	}

	private void setProductDetails(String[] detailIds, String[] detailNames, String[] detailValues, Product product) {
		// TODO Auto-generated method stub
		if (detailNames == null || detailNames.length == 0) return;
		
		for (int count = 0; count < detailNames.length; count++) {
			String name = detailNames[count];
			String value = detailValues[count];
			Integer id = Integer.parseInt(detailIds[count]);
			
			if (id != 0) {
				product.addDetail(id, name, value);
			} else if (!name.isEmpty() && !value.isEmpty()) {
				product.addDetail(name, value);
			}
		}
	}

	private void saveUploadImages(MultipartFile mainMultipartFile, MultipartFile[] extraImageMul, Product saveProduct) throws IOException {
		// TODO Auto-generated method stub
		
		if (!mainMultipartFile.isEmpty()) {
			String fileName = StringUtils.cleanPath(mainMultipartFile.getOriginalFilename());
			String uploadDir = "../product-images/" + saveProduct.getId();
			
			FileUploadUtil.cleanDir(uploadDir);
			FileUploadUtil.saveFile(uploadDir, fileName, mainMultipartFile);		
		}
		
		if (extraImageMul.length > 0) {
			String uploadDir = "../product-images/" + saveProduct.getId() + "/extras";
			
			for (MultipartFile multipartFile : extraImageMul) {
				if (multipartFile.isEmpty()) continue;
				
				String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
				FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			}
		}
	}

	private void setNewExtraImageNames(MultipartFile[] extraImageMul, Product product) {
		// TODO Auto-generated method stub
		
		if (extraImageMul.length > 0) {
			for (MultipartFile multipartFile : extraImageMul) {
				if (!multipartFile.isEmpty()) {
					String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
					
					if (!product.containsImageName(fileName)) {
						product.addExtraImage(fileName);
					}
				}
			}
		}
	}

	private void setMainImageName(MultipartFile mainImageMul, Product product) {
		// TODO Auto-generated method stub
		
		if (!mainImageMul.isEmpty()) {
			String fileName = StringUtils.cleanPath(mainImageMul.getOriginalFilename());
			product.setMainImage(fileName);
		}
	}

	@GetMapping("/products/{id}/enabled/{status}")
	public String updateCategoryEnabledStatus(@PathVariable("id") Integer id,
			@PathVariable("status") boolean enabled, RedirectAttributes re) {
		productService.updateProductEnabledStatus(id, enabled);
		String status = enabled ? "enabled" : "disabled";
		String message = "The product ID " + id + " has been" + status;
		
		re.addFlashAttribute("message", message);
		
		return "redirect:/products";
	}
	
	@GetMapping("/products/delete/{id}")
	public String deleteProduct(@PathVariable(name = "id") Integer id,
			Model model,
			RedirectAttributes re) {
		try {
			productService.delete(id);
			
			String productExtraImageDir = "../product-images/" + id + "/extras";
			String productImageDir = "../product-images/" + id;
			
			FileUploadUtil.removeDir(productExtraImageDir);
			FileUploadUtil.removeDir(productImageDir);
			
			re.addFlashAttribute("message", "The product ID: " + id + " has been deleted successfully");
		}
		catch (ProductNotFoundException ex) {
			re.addFlashAttribute("message", ex.getMessage());
		}
		
		return "redirect:/products";
	}
	
	@GetMapping("/products/edit/{id}")
	public String editProduct(@PathVariable("id") Integer id,
			Model model, RedirectAttributes re)  {
		try {
			Product product = productService.get(id);
			List<Brand> listBrands = brandService.listAll();
			Integer numberOfExistingExtraImages = product.getImages().size();
			
			model.addAttribute("product", product);
			model.addAttribute("pageTitle", "Edit Product (ID: " + id + ")");
			model.addAttribute("listBrands", listBrands);
			model.addAttribute("numberOfExistingExtraImages", numberOfExistingExtraImages);
			
			
			
			return "products/product_form";
		}
		catch (ProductNotFoundException e) {
			re.addFlashAttribute("message", e.getMessage());
			
			return "redirect:/products";
		}
	}
	
	@GetMapping("/products/detail/{id}")
	public String viewProduct(@PathVariable("id") Integer id,
			Model model, RedirectAttributes re)  {
		try {
			Product product = productService.get(id);
			
			model.addAttribute("product", product);
			
			return "products/product_detail_modal";
		}
		catch (ProductNotFoundException e) {
			re.addFlashAttribute("message", e.getMessage());
			
			return "redirect:/products";
		}
	}
}
