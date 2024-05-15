package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.ProductDAO;

@Controller

public class ShoppingCartController2 {
	@Autowired
	ProductDAO productDAO;

	@RequestMapping("/cart.html")
	public String list(Model model) {
		return "cart.html";
	}

}
