-- Clean up in case tables and database with same names are already present

drop table customers;
drop table products;
CREATE DATABASE IF NOT EXISTS retaildb;
drop database retaildb cascade;

-- Create customers table
create table customers (customer_id int, customer_name string, customer_city string, customer_state string, customer_zipcode string) row format delimited fields terminated by "\t" lines terminated by "\n";

-- Show table name followed by formatted description of customers table
show tables;
describe formatted customers;

-- Load data into customers table from customers.tsv file
-- Make sure that customers.tsv file is available in your present working directory
load data local inpath 'customers.tsv' overwrite into table customers;

-- Show first 10 records from customers table
select * from customers limit 10;

--Create products table as an external table
create external table products (salestxn_id int, product_name string, product_category string, category_id int, product_price double, product_quantity int, customer_id int) row format delimited fields terminated by "\t" lines terminated by "\n" stored as textfile location '/user/hduser/products_ext';

-- Show table names followed by formatted description of products table
show tables;
describe formatted products;

-- Load data into products table from products.tsv file
-- Make sure that products.tsv file is available in your present working directory
load data local inpath 'products.tsv' overwrite into table products;

-- Show first 20 records from products table
select * from products limit 20;
