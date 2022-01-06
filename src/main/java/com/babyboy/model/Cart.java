package com.babyboy.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "carts")
@PrimaryKeyJoinColumn(name="id")  
public class Cart extends Product {

	private int quantity;
	
	@OneToOne
	@JoinColumn(name = "bill_id", nullable = true)
	private Bill bill;
	
	public Cart(Product p) {
		super(p);
		this.quantity = 1;
	}
}
