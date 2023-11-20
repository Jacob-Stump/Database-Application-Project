-- Storing username and password

-- When a user registers or updates their password
SET @provideduser := 'mctesty'; -- Users provided username
SET @userpassword = 'password'; -- Password provided by user, retrieved from back end
SET @salt := generate_random_hash(); -- Generate a random salt through hash function(defined by created function for this database only)
SET @hashed_password := SHA2(CONCAT(@userpassword, @salt), 224); -- Hash the password with the salt
INSERT INTO logincreds (Username, HashPass, Salt, Employee_ID) VALUES (@provideduser, @hashed_password, @salt, 20); -- All fields just to show what is what

