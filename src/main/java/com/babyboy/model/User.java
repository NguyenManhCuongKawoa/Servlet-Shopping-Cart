package com.babyboy.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String email;
	private String password;
	@Column(name="image_url")
	private String imageUrl = "https://ih1.redbubble.net/image.1046392292.3346/st,small,845x845-pad,1000x1000,f8f8f8.jpg";
	
	private String phone;
	private String address;
	
	@Enumerated(EnumType.STRING)
	private Role role;
	
	@Enumerated(EnumType.STRING)
	@Column(name="login_type", nullable = true)
	private LoginType loginType;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private List<Product> products;
}
