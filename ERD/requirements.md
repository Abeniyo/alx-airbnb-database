# Entity-Relationship Diagram Requirements

## Objective

This document outlines the Entity-Relationship Diagram (ERD) for the Airbnb clone database schema. The ERD provides a visual overview of the entities, attributes, and relationships in the system, based on the official project specification.

---

## Entities and Attributes

The key entities in the schema include:

### 1. User
- `user_id` (UUID, Primary Key)
- `first_name`, `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, NULL)
- `role` (ENUM: guest, host, admin, NOT NULL)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### 2. Property
- `property_id` (UUID, Primary Key)
- `host_id` (UUID, Foreign Key → User)
- `name`, `description`, `location` (VARCHAR/TEXT, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at`, `updated_at` (TIMESTAMP)

### 3. Booking
- `booking_id` (UUID, Primary Key)
- `property_id` (Foreign Key → Property)
- `user_id` (Foreign Key → User)
- `start_date`, `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: pending, confirmed, canceled)
- `created_at` (TIMESTAMP)

### 4. Payment
- `payment_id` (UUID, Primary Key)
- `booking_id` (Foreign Key → Booking)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP)
- `payment_method` (ENUM: credit_card, paypal, stripe)

### 5. Review
- `review_id` (UUID, Primary Key)
- `property_id` (Foreign Key → Property)
- `user_id` (Foreign Key → User)
- `rating` (INTEGER, CHECK rating BETWEEN 1 AND 5)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP)

### 6. Message
- `message_id` (UUID, Primary Key)
- `sender_id`, `recipient_id` (Foreign Key → User)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP)

---

## Relationships

- **User** 1 ── ∞ **Property**
- **User** 1 ── ∞ **Booking**
- **Property** 1 ── ∞ **Booking**
- **Booking** 1 ── 1 **Payment**
- **User** 1 ── ∞ **Review**
- **User** 1 ── ∞ **Message** (sender & recipient)

All relationships are based on foreign key constraints and normalized design.

---

## ️ ER Diagram Link

You can view the ER Diagram via the link below:

**[Click here to view the ER Diagram](https://drive.google.com/file/d/1zLHHABTiyZKiPZr-7YKO2oijXnRrhVtH/view?usp=sharing)**  

## Notes

- Primary and foreign keys are labeled and color-coded
- Constraints like NOT NULL, UNIQUE, ENUMs, and CHECKs are noted in attributes

