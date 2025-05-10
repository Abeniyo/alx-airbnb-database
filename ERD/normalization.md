# Database Normalization: Airbnb Clone

## Objective

This document outlines the normalization process applied to the database schema of the Airbnb clone project. The final schema is designed to comply with **Third Normal Form (3NF)** to eliminate redundancy, ensure data integrity, and improve performance.

---

## Normal Forms Applied

### 🔹 First Normal Form (1NF)
**Goal:** Eliminate repeating groups and ensure atomic (indivisible) values.

Applied by:
- Storing scalar values in all fields (e.g., `first_name`, `email`, `pricepernight`).
- Avoiding arrays or comma-separated lists.
- Creating one row per entity instance (e.g., one row per user, booking, property).

---

### Second Normal Form (2NF)
**Goal:** Eliminate partial dependency; every non-key attribute must depend on the whole primary key.

Applied by:
- Ensuring that all tables with composite keys (if any) are split appropriately.
- Using surrogate primary keys (`UUID`s) to simplify entity relationships.
- No partial dependencies exist because no composite keys are used.

---

### Third Normal Form (3NF)
**Goal:** Eliminate transitive dependency; non-key attributes must not depend on other non-key attributes.

Applied by:
- Separating concerns: each table focuses on a single entity or relationship.
- No derived fields are stored (e.g., total price is calculated, not duplicated).
- Foreign keys are used to reference related data instead of copying attributes.

---

## Entity Review and Justification

### User
- No repeating or derived fields.
- Role is an `ENUM`, not a separate table since the values are fixed and few.
- All attributes depend solely on the `user_id`.

### Property
- Associated with a `host_id` (User).
- All other attributes directly describe the property.
- No derived or transitive attributes.

### Booking
- Connected to `user_id` and `property_id`.
- `total_price` is atomic and relevant to this specific booking.
- Status is stored as an ENUM, avoiding lookup table unless extended in the future.

### Payment
- Depends directly on `booking_id`.
- No redundant or derived attributes.

### Review
- Related to `user_id` and `property_id`.
- Rating has a constraint (1–5), enforced through `CHECK`.
- No transitive dependencies.

### Message
- Uses `sender_id` and `recipient_id` for clarity.
- All fields are atomic and specific to the message.

---

## Conclusion

The database schema for the Airbnb clone has been **fully normalized up to 3NF**:
- No duplicate or redundant data
- All attributes are functionally dependent on primary keys
- No transitive or partial dependencies remain

The schema is clean, optimized, and ready for scalable application use.

