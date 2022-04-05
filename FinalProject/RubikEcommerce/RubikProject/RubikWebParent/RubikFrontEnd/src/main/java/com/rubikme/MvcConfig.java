package com.rubikme;

import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// User
//		String dirName = "user-photos";
//		
//		Path userPhotoDir = Paths.get(dirName);
//		
//		String userPhotosPath = userPhotoDir.toFile().getAbsolutePath();
//		
//		registry.addResourceHandler("/" + dirName + "/**").addResourceLocations("file:/" + userPhotosPath + "/");
		
		exposoDirectory("user-photos", registry);
		
		// Category
//		String categoryImagesName = "../category-images";
//		
//		Path categoryImagesDir = Paths.get(categoryImagesName);
//		
//		String categoryImagesPath = categoryImagesDir.toFile().getAbsolutePath();
//		
//		registry.addResourceHandler("/category-images/**")
//			.addResourceLocations("file:/" + categoryImagesPath + "/");
		
		exposoDirectory("../category-images", registry);
		
		// Brand
//		String brandLogoNameDirName = "../brand-logos";
//		
//		Path brandLogoNameDir = Paths.get(brandLogoNameDirName);
//		
//		String brandLogoPath = brandLogoNameDir.toFile().getAbsolutePath();
//		
//		registry.addResourceHandler("/brand-logos/**")
//			.addResourceLocations("file:/" + brandLogoPath + "/");
		
		exposoDirectory("../brand-logos", registry);
		
		exposoDirectory("../product-images", registry);
	}
	
	private void exposoDirectory(String pathPattern, ResourceHandlerRegistry registry) {
		Path path = Paths.get(pathPattern);
		String absolutePath = path.toFile().getAbsolutePath();
		String logicalPath = pathPattern.replace("..", "") + "/**";
		
		
		registry.addResourceHandler(logicalPath)
		.addResourceLocations("file:/" + absolutePath + "/");
		
	}
}
