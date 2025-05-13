# Join Queries - ALX Airbnb Database

## Task 0: Write Complex Queries with Joins

This task demonstrates advanced SQL JOIN techniques applied to the Airbnb database schema.

### INNER JOIN
Retrieves all bookings along with the user details who made the booking.

```sql
SELECT b.booking_id, b.property_id, b.start_date, ..., u.email
FROM Booking b
INNER JOIN User u ON b.user_id = u.user_id;

## Task 1: Practice Subqueries

This task focuses on mastering subqueries by writing both non-correlated and correlated forms.

### Non-Correlated Subquery
Finds properties with an average rating greater than 4.0.

```sql
SELECT p.property_id, p.name
FROM Property p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM Review r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

## Task 2: Aggregations and Window Functions

This task demonstrates proficiency with SQL aggregation functions and window functions to derive analytical insights from the Airbnb database.

---

### Aggregation Query

**Objective:** Count the total number of bookings made by each user.

```sql
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name
ORDER BY 
    total_bookings DESC;








