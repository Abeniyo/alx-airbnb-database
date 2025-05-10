# Database Script 0x01 - Schema (DDL)

## Objective
Define the Airbnb database schema using SQL `CREATE TABLE` statements.

## Files
- `schema.sql`: Contains the full DDL for the Airbnb project.
- `README.md`: Describes the schema structure, constraints, and indexing logic.

## Entities & Schema Design

### 1. `User`
- `user_id`: UUID, Primary Key, Indexed
- Fields: `first_name`, `last_name`, `email` (UNIQUE), `password_hash`, `phone_number`, `role` (ENUM), `created_at`

### 2. `Property`
- `property_id`: UUID, Primary Key
- Foreign Key: `host_id` references `User(user_id)`
- Fields: `name`, `description`, `location`, `pricepernight`, timestamps

### 3. `Booking`
- `booking_id`: UUID, Primary Key
- Foreign Keys: `property_id`, `user_id`
- Fields: `start_date`, `end_date`, `total_price`, `status` (ENUM), `created_at`

### 4. `Payment`
- `payment_id`: UUID, Primary Key
- Foreign Key: `booking_id`
- Fields: `amount`, `payment_date`, `payment_method` (ENUM)

### 5. `Review`
- `review_id`: UUID, Primary Key
- Foreign Keys: `property_id`, `user_id`
- Fields: `rating` (1–5, CHECK), `comment`, `created_at`

### 6. `Message`
- `message_id`: UUID, Primary Key
- Foreign Keys: `sender_id`, `recipient_id` referencing `User(user_id)`
- Fields: `message_body`, `sent_at`

## ️ Constraints Applied
- All `UUID` primary keys.
- ENUM values for fields like `role`, `status`, and `payment_method`.
- Foreign key constraints for relational integrity.
- Unique email addresses for users.
- CHECK constraints for rating values.

##️  Indexes
- Automatic indexing on all primary keys.
- Manual indexes on:
  - `User.email`
  - `Property.property_id`
  - `Booking.property_id`, `Booking.booking_id`

## Normalization
All tables follow 1NF, 2NF, and 3NF:
- Atomic fields
- Foreign key relations eliminate redundancy
- Referential integrity enforced
