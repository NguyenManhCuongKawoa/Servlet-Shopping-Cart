package com.babyboy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "products")
@Inheritance(strategy = InheritanceType.JOINED)  
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	
	@OneToOne()
	@JoinColumn(
		name="category_id"
	)
	private Category category;
	
	private double price;
	
	@Column(name="image_url")
	private String imageUrl;
	
	public Product() {
		
	}
	
	public Product(Product p) {
		this.id = p.getId();
		this.name = p.getName();
		this.category = p.getCategory();
		this.price = p.getPrice();
		this.imageUrl = p.getImageUrl();
	}
}
