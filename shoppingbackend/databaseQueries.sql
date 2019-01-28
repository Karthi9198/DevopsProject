CREATE TABLE category(

	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_URL VARCHAR(50),
	is_active BOOLEAN,
	
	CONSTRAINT pk_category_id PRIMARY KEY (id)
	
);
select * from category;


INSERT INTO category (name, description, image_url, is_active) VALUES ('Books','This is for Books category', 'CAT_3.png',true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('StoryBooks','This is for Story Books category', 'CAT_3.png',true);
INSERT INTO category (name, description, image_url, is_active) VALUES ('Literatures','This is for Literatures category', 'CAT_3.png',true);

CREATE TABLE  user_detail(
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	ROLE VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(100),
	email VARCHAR(100),
	contact_number VARCHAR(15),
	CONSTRAINT pk_user_id PRIMARY KEY(id),
);
 

INSERT INTO user_detail
(first_name, last_name, ROLE, enabled, password, email, contact_number)
VALUES ('Karthikeyan', 'N', 'ADMIN', TRUE, '$2b$10$67V5SOpN9EbLtNBdENmOPu/FKwbdzNnBrXeED.rqLtraG9vzxu55a', 'karthi98amb@gmail.com', '9600016430');
 
INSERT INTO user_detail
(first_name, last_name, ROLE, enabled, password, email, contact_number)
VALUES ('Karthi', 'keyan', 'SUPPLIER', TRUE, '$2b$10$rQJnGtEsU6Bjgw/feror/.KpnpcdRwxSeJCC7qJLxamw5Pt09GUcq', 'karthi.smart9198@gmail.com', '9940682030');

CREATE TABLE product(
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	author VARCHAR(50),
	description VARCHAR(250),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	suppplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail (id),
	
);

INSERT INTO product(code, name, author, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('CD12345', 'Book name', 'Author name', 'About book', '500', '1', TRUE, 3, 2, 0, 0 )

INSERT INTO product(code, name, author, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('CD6789', 'Book name', 'Author name', 'About book', '500', '1', TRUE, 'category','supplier'3, 3, 0, 0 )

-- the address table to store the user billing and shipping addresses
CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

-- adding a supplier correspondece address
INSERT INTO address( user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping) 
VALUES (4, '36 Lakshmi Nivas, Vasuki Street', 'Krishnapuram, Ambattur', 'Chennai', 'Tamil Nadu', 'India', '600053', true, false );

-- the cart table to store the user cart top-level details
CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);
-- adding a cart for testing 
INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (4, 0, 0);




-- the cart line table to store the cart details

CREATE TABLE cart_line (
	id IDENTITY,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id ) REFERENCES product (id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
);


-- the order detail table to store the order

CREATE TABLE order_detail (
	id IDENTITY,
	user_id int,
	order_total DECIMAL(10,2),
	order_count int,
	shipping_id int,
	billing_id int,
	order_date date,
	CONSTRAINT fk_order_detail_user_id FOREIGN KEY (user_id) REFERENCES user_detail (id),
	CONSTRAINT fk_order_detail_shipping_id FOREIGN KEY (shipping_id) REFERENCES address (id),
	CONSTRAINT fk_order_detail_billing_id FOREIGN KEY (billing_id) REFERENCES address (id),
	CONSTRAINT pk_order_detail_id PRIMARY KEY (id)
);

-- the order item table to store order items

CREATE TABLE order_item (
	id IDENTITY,
	order_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	CONSTRAINT fk_order_item_product_id FOREIGN KEY (product_id) REFERENCES product (id),
	CONSTRAINT fk_order_item_order_id FOREIGN KEY (order_id) REFERENCES order_detail (id),
	CONSTRAINT pk_order_item_id PRIMARY KEY (id)
);
