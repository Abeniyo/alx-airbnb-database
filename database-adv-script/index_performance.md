# Index Performance Report - ALX Airbnb Database

## Objective

Improve the performance of frequently used queries by identifying high-usage columns and applying indexes.

---

## Indexed Columns

### User Table
| Column        | Reason                   |
|---------------|---------------------------|
| email         | Frequently queried (login, lookups) |
| role          | Filtered when listing roles (e.g., admins, hosts) |

### Property Table
| Column         | Reason                            |
|----------------|------------------------------------|
| location       | Common in searches by region       |
| host_id        | Used in JOINs with the User table  |
| pricepernight  | Used in sorting/filtering listings |

### Booking Table
| Column         | Reason                             |
|----------------|-------------------------------------|
| user_id        | JOINs with User, analytics          |
| property_id    | JOINs with Property, reporting      |
| status         | Frequently filtered (pending, etc.)|
| start_date     | Range queries (availability checks) |

---

## Query Performance Comparison

### Example Query (Before Indexing)

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'some-uuid';

