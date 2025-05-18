-- Create indexes to optimize queries
-- User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_price ON Property(pricepernight);

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Measure query performance using EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'some-uuid';

EXPLAIN ANALYZE
SELECT * FROM Property WHERE location = 'Addis Ababa';

EXPLAIN ANALYZE
SELECT * FROM Booking WHERE status = 'pending' AND start_date >= '2025-06-01';
