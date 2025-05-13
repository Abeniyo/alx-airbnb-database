# Partition Performance Report - Booking Table

## Goal

Partition the large `Booking` table by `start_date` to improve performance on date-range queries.

---

##  Method

Used PostgreSQL's **RANGE partitioning** to split the table into yearly partitions.

### Partition Strategy:
- Column: `start_date`
- Type: `RANGE`
- Years: 2023, 2024, 2025

---

## Performance Test

### Query Tested:
```sql
SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
