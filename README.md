# Sakila DVD Rental database # 

The Sakila Database holds information about a company that rents movie DVDs. The DVD rental database represents the business processes of a DVD rental store. The DVD rental database has many objects including:

> 15 tables
> 
> 1 trigger
> 
> 7 views
>
> 8 functions
> 
> 1 domain
> 
> 13 sequences
> 
# Database Tables #

There are 15 tables in the DVD Rental database:

- actor – stores actors data including first name and last name.
- film – stores film data such as title, release year, length, rating, etc.
- film_actor – stores the relationships between films and actors.
- category – stores film’s categories data.
- film_category- stores the relationships between films and categories.
- store – contains the store data including manager staff and address.
- inventory – stores inventory data.
- rental – stores rental data.
- payment – stores customer’s payments.
- staff – stores staff data.
- customer – stores customer data.
- address – stores address data for staff and customers
- city – stores city names.
- country – stores country names.
>
# Project Objective #

For this project, I used **PostgreSQL** to query the database to gain an understanding of the customer base, such as:

1. What categories of movies are families watching?
2. What is the difference in the rental duration of family movies in four quartiles?
3. What is the difference in rental numbers in the two stores?
4. Who were the top 10 paying customers related to the payinig amounts and the paying times?



