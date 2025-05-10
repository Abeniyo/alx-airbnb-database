# Database Script 0x02 - Seed Data

## Objective
Populate the Airbnb database with realistic sample data for testing and development.

## Files
- `seed.sql`: SQL script to insert sample records into all tables.
- `README.md`: Describes the seeding strategy and examples.

## Sample Data Added

### 1. Users
- 3 users: Guest (Alice), Host (Bob), Admin (Carol)
- Fields: Name, email, password hash, phone, role

### 2. Properties
- 2 properties hosted by Bob
- Locations: Addis Ababa, Bahir Dar
- Includes price, description, timestamps

### 3. Bookings
- 2 bookings by Alice
- Includes total price, status (`confirmed`, `pending`)

### 4. Payments
- 1 payment linked to confirmed booking
- Method: `credit_card`

### 5. Reviews
- 1 review by Alice for Bob’s property
- Rating (1–5) and comment

### 6. Messages
- Simulated chat between Alice (guest) and Bob (host)

## Foreign Key Logic
Foreign keys use subqueries to automatically select correct `user_id`, `property_id`, etc., based on email or property name.

## Usage
Ensure `uuid-ossp` extension is enabled, then:

```bash
psql -d airbnb_db -f schema.sql   # Run from 0x01 directory
psql -d airbnb_db -f seed.sql     # Run from 0x02 directory
