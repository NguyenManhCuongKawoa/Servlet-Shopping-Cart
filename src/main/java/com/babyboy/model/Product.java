package com.babyboy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	
	private String description;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "u_id")
	private User user;
	
	public Product() {
		
	}
	
	public Product(Product p) {
		this.id = p.getId();
		this.name = p.getName();
		this.category = p.getCategory();
		this.price = p.getPrice();
		this.description = p.getDescription();
		this.imageUrl = p.getImageUrl();
	}
}
