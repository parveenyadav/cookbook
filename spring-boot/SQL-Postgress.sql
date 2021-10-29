 -- SELECT
	--Select Syntax
		--SELECT column Names FROM table_name;
	--Select DISTINCT - DISTINCT values for a COLUMN
		SELECT DISTINCT (Column) FROM table; 
	--Select Count DISTINCT column
		select count(distinct first_name) from customer;
	
	--WHERE Clause
		-- Syntax
			--SELECT columns FROM table WHERE conditions;
			-- OPERATORS in Where Clause
				--Comparision operators [=,<,>,!=]
				--Logical Operators [AND, OR, NOT]
	--ORDER BY
		--SELECT column Names FROM table_name ORDER BY column_name ASC/DSC
		--Last thing in the query i.e order by will be the last thing in the query
		-- ASC is by DEFAULT
		-- can user multiple column
			SELECT company, name, sales FROM table ORDER BY company, sales
			select * from customer order by store_id desc, first_name asc;
	--LIMIT
		-- Last thing in the query
		select * from payment order by payment_date desc limit 5;
	--BETWEEN
		-- check value BETWEEN low and high - inclusive of both low and high
		-- NOT BETWEEN low AND high - exclusive of of both low and high
		-- can be used for DATE
		select * from payment where amount between 8 and 9;
		select * from payment where amount not between 8 and 9;
	--IN
		-- create a consition that checks to see if a value is in a list of options
		-- SYNTAX
			--value in (option1, option2)
			--value not in (option1, option2)
			
	--LIKE & ILIKE
		-- pattern matching string data with use of wildcard characters
		-- Percentage(%) - many any SEQUENCE of CHARACTER
		--UnderScore (_) - Matches any single character
		--All names begin with and 'A'
			-- WHERE name LIKE 'A%'
		--All names end with an 'a'
			-- WHERE name LIKE '%a'
		-- ILIKE is case-insenitive
		-- UnderScore allows us to replace a single character with wildcard
			--Get All Mission Impossible films
				-- Where title LIKE 'Mission Impossible _'
			-- VERSION#A4 VERSION#B7
				-- WHERE value LIKE 'VERSION#_ _'
			-- Complex pattern matching - Cheryl, Theresa, Sherri
				-- Where name LIKE '_her%'
	
	--GROUP BY
		-- group by allows us to aggregate data and apply functions to better understand how data is distributed per category
		-- aggregate functions - SUM, COUNT, MIN, MAX, AVG
		--SYNTAX
			--SELECT category_col, AGG(data_col) FROM table GROUP BY category_col
			-- GROUP BY must appear after FROM or WHERE statement
			-- In the SELCT statement, columns must either have an aggregate function or be in the GROUP By call ex. category_col
			-- the order of columns after GROUP BY matters but not in select
			SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;
			SELECT customer_id, COUNT(amount) FROM payment GROUP BY customer_id ORDER BY COUNT(amount) DESC;
			SELECT DATE(payment_date), SUM(amount) FROM payment GROUP BY DATE(payment_date) ORDER BY SUM(amount) DESC;
			
		--HAVING - HAVING clause allows us to filter after an aggregation has already taken place
			SELECT company, SUM(sales) FROM finance_table WHERE company!='Google' GROUP BY company HAVING SUM(sales)>1000
			SELECT customer_id, COUNT(*) FROM payment GROUP BY customer_id HAVING COUNT(*)>=40;
	
	--JOINS
		--JOINS allows us to combine information from multiple tables
		--AS - AS allows us to create alias for a column or table
			SELCT SUM(amount) as net_revenue FROM payment
			--AS operator get executed at the very end of a query, meaning we cannot use it in WHERE clause, it can only be used in SELECT
			
			
		--INNER JOIN
			--main reason for different types of joins is to decide how to deal with information only present in one of the joined tables
			--An INNER JOIN will result with the set of records that MATCH IN BOTH tables
			--SYNTAX
				SELECT * FROM TableA INNER JOIN TableB ON TableA.col_match=TableB.col_match
		--OUTER JOINS
			-- outer join allows us to specify how to deal with values only present in one of the tables being joined
			--TYPES
				-- FULL OUTER JOIN
				-- LEFT OUTER JOIN
				-- RIGHT OUTER JOIN
				
			--FULL OUTER JOIN
				-- fetch everything from both tables
				-- table order does not matter
				-- the values not present in either of the tables is filled as null under the corresponding columns 
				SELECT * FROM TableA FULL OUTER JOIN TableB ON TableA.col_match=TableB.col_match
				-- FULL OUTER JOIN with WHERE clause
					-- Get rows UNIQUE to either table i.e rows not found in both tables
					-- it is opposite of INNER JOIN
					SELECT * FROM TableA FULL OUTER JOIN TableB ON TableA.col_match=TableB.col_match WHERE TableA.id IS null OR TableB.id IS null
			--LEFT OUTER JOIN
				-- A LEFt OUTER JOIN results in the set of records that are in the left table, if there is no mastch with the right table, the results are null
				SELECT * FROM TableA LEFT OUTER JOIN TableB ON TableA.col_match=TableB.col_match
				-- order of tables matter
				--LEFT OUTER JOIN with WHERE clause -- Get rows UNIQUE to left table
					SELECT * FROM TableA LEFT OUTER JOIN TableB ON TableA.col_match=TableB.col_match WHERE TableB.id IS null
					
		-- UNION
			-- combine the result of two or more SELECT statements
			-- SELECT column_name(s) FROM table1 UNION SELECT column_name(s) FROM table2


-- CREATING AND UPDATING DATABASES AND TABLES
	--DATA TYPES
	--PRIMARY KEY
	-- CONSTRAINTS
		-- COLUMN CONSTRAINTS -applies to COLUMNS
		-- TABLE CONSTRAINTS - applies to TABLE
		 -- NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK
	
	--CREATE TABLE
		--SYNTAX
			CREATE TABLE table_name(
				column_name TYPE column_constraint,
				column_name TYPE column_constraint,
				
				table_constraint table_constraint
			) INHERITS existing_table_name;
			
		--
			