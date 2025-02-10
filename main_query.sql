SELECT
	s_ord.order_id,
	CONCAT(s_cus.first_name, ' ', s_cus.last_name) AS 'customers',
	s_cus.city,
	s_cus.state,
	s_ord.order_date,
	SUM(s_ite.quantity) AS 'total_units',
	SUM(s_ite.quantity * s_ite.list_price) AS 'revenue',
	p_prod.product_name,
	p_bra.brand_name,
	p_cat.category_name,
	s_sto.store_name,
	CONCAT(s_sta.first_name, ' ', s_sta.last_name) AS 'sales_rep'
FROM sales.orders s_ord
JOIN sales.customers s_cus
	ON s_ord.customer_id = s_cus.customer_id
JOIN sales.order_items s_ite
	ON s_ord.order_id = s_ite.order_id
JOIN production.products p_prod
	ON s_ite.product_id = p_prod.product_id
JOIN production.brands p_bra
	ON p_prod.brand_id = p_bra.brand_id
JOIN production.categories p_cat
	ON p_prod.category_id = p_cat.category_id
JOIN sales.stores s_sto
	ON s_ord.store_id = s_sto.store_id
JOIN sales.staffs s_sta
	ON s_ord.staff_id = s_sta.staff_id
GROUP BY
	s_ord.order_id,
	CONCAT(s_cus.first_name, ' ', s_cus.last_name),
	s_cus.city,
	s_cus.state,
	s_ord.order_date,
	p_prod.product_name,
	p_bra.brand_name,
	p_cat.category_name,
	s_sto.store_name,
	CONCAT(s_sta.first_name, ' ', s_sta.last_name)