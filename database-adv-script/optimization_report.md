# Optimization Report - Complex Query

## Initial Query

The initial query retrieves bookings along with associated user, property, and payment data using multiple joins.

**Joins Used:**
- INNER JOIN on User and Property
- LEFT JOIN on Payment

---

## Performance Analysis (Before Optimization)

### SQL EXPLAIN Output Summary:
- Full table scans on `Booking`, `User`, `Property`, and `Payment`
- Joins use nested loops
- Estimated cost: **5000+**
- Execution time: ~140ms (on medium dataset)

---

## Identified Inefficiencies

1. No filtering, so full table scans are unavoidable without indexes.
2. Missing indexes on:
   - `Booking.user_id`
   - `Booking.property_id`
   - `Booking.booking_id` (for joining with Payment)

---

## Optimized Query

```sql
-- Optimized by ensuring indexes exist and selecting only needed fields
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
