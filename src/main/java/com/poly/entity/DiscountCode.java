package com.poly.entity;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "discount_codes")
public class DiscountCode implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String code;
	private Double discountAmount;

	private int quantity;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate start_Date;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate end_Date;

	private boolean activate;

	// Getters and setters
}