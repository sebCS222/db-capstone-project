DELIMITER //
CREATE PROCEDURE UpdateBooking(IN _booking_id INT, IN _new_booking_date DATE)
BEGIN
  UPDATE bookings
  SET date = _new_booking_date
  WHERE booking_id = _booking_id;
END //
DELIMITER ;
