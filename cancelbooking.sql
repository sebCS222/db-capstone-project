DELIMITER //
CREATE PROCEDURE CancelBooking(IN _booking_id INT)
BEGIN
  DELETE FROM bookings
  WHERE booking_id = _booking_id;
END //
DELIMITER ;
