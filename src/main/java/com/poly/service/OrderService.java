package com.poly.service;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;

import com.poly.entity.Order;
import com.poly.entity.OrderDetail;

public interface OrderService {
	public List<Order> findAll();

	public Order create(JsonNode orderData);

	public Order findById(Long id);

	public List<Order> findByUsername(String username);

	public Order update(Order order);

	public void delete(Long id);

	public void deleteOrderDetailByOrderId(Long id);

	public List<Order> getCurrentUserOrders();

	public List<OrderDetail> getDetailDataById(Long id);

	public List<Object[]> getShippedOrdersForCurrentAccount(String username);

	public List<Object[]> getUnshippedOrdersForCurrentAccount(String username);

	public List<Order> findOrdersByAccount(String username);

}
