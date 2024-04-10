package com.poly.entity;

import java.io.Serializable;

import javax.persistence.*;

import lombok.Data;

@Data
@Entity
@Table(name = "Sizes")
public class Size implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@ManyToOne
	@JoinColumn(name = "productId")
	private Product product;

	@Column(name = "size")
	private Integer sizes;

	@Column(name = "quantity")
	private Integer quantity;

}
