package com.babyboy.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "bills")
public class Bill {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String address;
	private String phone;
	private String moreInfo;
	
	
	@OneToOne
	@JoinColumn(
		name="user_id"
	)
	private User user;
	
	@Enumerated(EnumType.STRING)
	private Status status;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "bill", cascade = CascadeType.ALL)
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "bill", cascade = CascadeType.ALL)
	private List<Cart> carts;
	
}
