-- Checking user credentials to database values

-- Compare passwords when a user logs in  
SET @input_password := 'password'; -- Provided password
SET @salt := (SELECT Salt FROM logincreds WHERE Username = 'mctesty'); -- Retrieve the stored salt for user
SET @hashed_input_password := SHA2(CONCAT(@input_password, @salt), 224); -- Hash the input password with the stored salty field
SELECT Username FROM logincreds WHERE Username = 'mctesty' AND HashPass = @hashed_input_password; -- Check if the hashed input password matches the stored hashed password

