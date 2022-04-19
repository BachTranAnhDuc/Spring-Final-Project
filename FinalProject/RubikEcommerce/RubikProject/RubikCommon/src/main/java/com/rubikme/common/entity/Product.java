package com.rubikme.common.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.decimal4j.util.DoubleRounder;

@Entity
@Table(name = "products")
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(unique = true, length = 256, nullable = false)
	private String name;
	
	@Column(unique = true, length = 256, nullable = false)
	private String alias;
	
	@Column(length = 512, nullable = false, name = "short_description")
	private String shortDescription;
	
	@Column(length = 4096, nullable = false, name = "full_description")
	private String fullDescription;
	
	@Column(name = "created_time")
	private Date createdTime;
	
	@Column(name = "updated_time")
	private Date updatedTime;
	
	private boolean enabled;
	
	@Column(name = "in_stock")
	private boolean inStock;
	
	private float cost;
	
	private float price;
	
	@Column(name = "discount_percent")
	private float discountPercent;
	
	private int reviewCount;
	
	private float averageRating;
	
	@Column(name = "main_image", nullable = false)
	private String mainImage;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;
	
	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;
	
	@OneToMany(mappedBy = "product",
			cascade = CascadeType.ALL,
			orphanRemoval = true)
	private Set<ProductImage> images = new HashSet<>();
	
	@OneToMany(mappedBy = "product",
			cascade = CascadeType.ALL,
			orphanRemoval = true)
	private List<ProductDetail> details = new ArrayList<>();
	
	public Product() {
		
	}
		
	public Product(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getFullDescription() {
		return fullDescription;
	}

	public void setFullDescription(String fullDescription) {
		this.fullDescription = fullDescription;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isInStock() {
		return inStock;
	}

	public void setInStock(boolean inStock) {
		this.inStock = inStock;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public float getDiscountPercent() {
		return discountPercent;
	}

	public void setDiscountPercent(float discountPercent) {
		this.discountPercent = discountPercent;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public float getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(float averageRating) {
		this.averageRating = averageRating;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public String getMainImage() {
		return mainImage;
	}

	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}

	public Set<ProductImage> getImages() {
		return images;
	}

	public void setImages(Set<ProductImage> images) {
		this.images = images;
	}
	
	public void addExtraImage(String imageName) {
		this.images.add(new ProductImage(imageName, this));
	}
	
	public List<ProductDetail> getDetails() {
		return details;
	}

	public void setDetails(List<ProductDetail> details) {
		this.details = details;
	}
	
	public void addDetail(String name, String value) {
		this.details.add(new ProductDetail(name, value, this));
	}
	
	public void addDetail(Integer id, String name, String value) {
		this.details.add(new ProductDetail(id, name, value, this));
	}

	@Transient
	public String getMainImagePath() {
		
		if (id == null || mainImage == null) {
			return "/images/image-thumbnail.png";
		}
		
		return "/product-images/" + this.id + "/" + this.mainImage;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + "]";
	}

	public boolean containsImageName(String imageName) {
		// TODO Auto-generated method stub
		
		Iterator<ProductImage> iterator = images.iterator();
		
		while (iterator.hasNext()) {
			ProductImage image = iterator.next();
			
			if (image.getName().equals(imageName)) {
				return true;
			}
		}
		
		return false;
	}
	
	@Transient
	public float getDiscountPrice() {
		
		float dis = price * ((100 - discountPercent) / 100);
		
		if (discountPercent > 0) {
			//return (float) DoubleRounder.round(dis, 2);
			
			return dis;
		}
		
		return this.price;
	}
	
	@Transient
	public String getShortName() {
		if (name.length() > 70) {
			return name.substring(0, 70).concat("...");
		}
		
		return this.name;
	}
	
	@Transient
	public String getURI() {
		return "/p/" + this.alias + "/";
	}
	
	@Transient
	private boolean customerCanReview;
	
	@Transient
	private boolean reviewByCustomer;

	public boolean isCustomerCanReview() {
		return customerCanReview;
	}

	public void setCustomerCanReview(boolean customerCanReview) {
		this.customerCanReview = customerCanReview;
	}

	public boolean isReviewByCustomer() {
		return reviewByCustomer;
	}

	public void setReviewByCustomer(boolean reviewByCustomer) {
		this.reviewByCustomer = reviewByCustomer;
	}
	
}
