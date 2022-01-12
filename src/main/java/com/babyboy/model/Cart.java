package com.babyboy.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@Entity
@Table(name = "carts")
//@PrimaryKeyJoinColumn(name="id")  
public class Cart implements Serializable {

	
	@Id
	@OneToOne()
	@JoinColumn(name = "product_id")
	private Product product;
	
	private int quantity = 1;

	@OneToOne
	@JoinColumn(name = "bill_id", nullable = true)
	private Bill bill;
	
}
