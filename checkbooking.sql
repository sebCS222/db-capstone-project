DELIMITER //
CREATE PROCEDURE CheckBooking(IN book_date DATE, IN _table_no INT)
BEGIN
  DECLARE is_booked INT;

  SELECT COUNT(*)
  INTO is_booked
  FROM bookings
  WHERE booking_date = book_date AND table_no = _table_no;

  IF is_booked > 0 THEN
    SELECT CONCAT("Table ", _table_no, " is already booked.") as Booking_Status;
  ELSE 
    SELECT "The table is open." as Booking_Status;
  END IF;
END //
DELIMITER ;
