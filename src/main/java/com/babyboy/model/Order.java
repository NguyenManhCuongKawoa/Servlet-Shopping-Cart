package com.babyboy.model;

import java.util.Date;

import lombok.Data;

@Data
public class Order{
	private int o_id;
	private int u_id;
	private Product product;
	private int o_quantity;
	private Date o_date;
	
}
