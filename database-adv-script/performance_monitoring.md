# Performance Monitoring Report - Airbnb Database

## Objective
Monitor and refine the performance of frequently used queries in the database by analyzing their execution plans and applying optimizations (indexes, schema changes).

---

## 1. Query Monitoring Using `EXPLAIN ANALYZE`

### Query 1: Fetch All Bookings for a Specific User
```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'abcd-1234-uuid';
