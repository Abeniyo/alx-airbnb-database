-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (uuid_generate_v4(), 'Abenezer', 'Abreham', 'aben@gmail.com', 'hashed_pwd_1', '0912345678', 'guest'),
  (uuid_generate_v4(), 'Hannah', 'Abreham', 'hani@gmail.com', 'hashed_pwd_2', '0923456789', 'host'),
  (uuid_generate_v4(), 'Ermias', 'Bezabih', 'ermi@gmail.com', 'hashed_pwd_3', NULL, 'admin');

-- Insert Properties
-- Assuming Bob is a host
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (uuid_generate_v4(), (SELECT user_id FROM User WHERE email = 'hani@gmail.com'), 'Charming Cottage', 'A lovely two-bedroom cottage.', 'Addis Ababa', 75.00),
  (uuid_generate_v4(), (SELECT user_id FROM User WHERE email = 'hani@gmail.com'), 'Downtown Apartment', 'Modern flat in the city center.', 'Bahir Dar', 120.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (
    uuid_generate_v4(),
    (SELECT property_id FROM Property WHERE name = 'Charming Cottage'),
    (SELECT user_id FROM User WHERE email = 'aben@gmail.com'),
    '2025-06-01',
    '2025-06-05',
    300.00,
    'confirmed'
  ),
  (
    uuid_generate_v4(),
    (SELECT property_id FROM Property WHERE name = 'Downtown Apartment'),
    (SELECT user_id FROM User WHERE email = 'aben@gmail.com'),
    '2025-07-10',
    '2025-07-15',
    600.00,
    'pending'
  );

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  (
    uuid_generate_v4(),
    (SELECT booking_id FROM Booking WHERE total_price = 300.00),
    300.00,
    'credit_card'
  );

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (
    uuid_generate_v4(),
    (SELECT property_id FROM Property WHERE name = 'Charming Cottage'),
    (SELECT user_id FROM User WHERE email = 'aben@gmail.com'),
    5,
    'Wonderful stay, would book again!'
  );

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (
    uuid_generate_v4(),
    (SELECT user_id FROM User WHERE email = 'aben@gmail.com'),
    (SELECT user_id FROM User WHERE email = 'hani@gmail.com'),
    'Hi Hani, is the Downtown Apartment available for August?'
  ),
  (
    uuid_generate_v4(),
    (SELECT user_id FROM User WHERE email = 'hani@gmail.com'),
    (SELECT user_id FROM User WHERE email = 'aben@gmail.com'),
    'Hi Aben, yes it is available!'
  );

