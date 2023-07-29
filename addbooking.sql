DELIMITER //
CREATE PROCEDURE AddBooking(IN _booking_id INT, IN _customer_id INT, IN _booking_date DATE, IN _table_no INT)
BEGIN
  INSERT INTO bookings(booking_id, customer_customer_id, date, table_no)
  VALUES(_booking_id, _customer_id, _booking_date, _table_no);
END //
DELIMITER ;