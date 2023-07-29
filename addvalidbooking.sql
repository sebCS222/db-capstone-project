DELIMITER //
CREATE PROCEDURE AddValidBooking(IN book_date DATE, IN _table_no INT, IN _customer_id INT)
BEGIN
  DECLARE is_booked INT;

  START TRANSACTION;

  SELECT COUNT(*)
  INTO is_booked
  FROM bookings
  WHERE date = book_date AND table_no = _table_no;

  IF is_booked > 0 THEN
    SELECT CONCAT("Table ", _table_no, " is already booked - booking cancelled.") as Booking_Status;
    ROLLBACK;
  ELSE 
    INSERT INTO bookings(date, table_no, customer_customer_id)
    VALUES(book_date, _table_no, _customer_id);
    SELECT CONCAT("Table ", _table_no, " successfully booked.") as Booking_Status;
    COMMIT;
  END IF;
END //
DELIMITER ;
