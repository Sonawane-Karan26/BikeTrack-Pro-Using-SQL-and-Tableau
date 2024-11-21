SELECT
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name) AS 'customers',
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
	prod.product_name,
	cat.category_name,
	bra.brand_name,
	st.store_name,
	CONCAT(sta.first_name,' ',sta.last_name) AS 'sales_rep'
FROM BikeStores.sales.customers cus

JOIN BikeStores.sales.orders ord
ON cus.customer_id = ord.customer_id

JOIN BikeStores.sales.order_items ite
ON ite.order_id = ord.order_id

JOIN BikeStores.production.products prod
ON ite.product_id = prod.product_id

JOIN BikeStores.production.categories cat
ON prod.category_id = cat.category_id

JOIN BikeStores.production.brands bra
ON prod.brand_id = bra.brand_id

JOIN BikeStores.sales.stores st
ON ord.store_id = st.store_id

JOIN BikeStores.sales.staffs sta
ON ord.staff_id = sta.staff_id

GROUP BY
	ord.order_id,
	cus.first_name,
	cus.last_name,
	cus.city,
	cus.state,
	ord.order_date,
	prod.product_name,
	cat.category_name,
	bra.brand_name,
	st.store_name,
	CONCAT(sta.first_name,' ',sta.last_name)