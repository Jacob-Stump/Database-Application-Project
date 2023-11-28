-- All functions and procedures for the project database


DELIMITER //
CREATE PROCEDURE GetVendorID(IN SelectedName VARCHAR(20), OUT VenID INT)
BEGIN
    SELECT Vendor_ID
    INTO VenID
    FROM vendors
    WHERE Vendor_Name = SelectedName;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetCatID(IN CatName CHAR(45), OUT CatID INT)
BEGIN
    SELECT Category_ID
    INTO CatIDUpdateProduct
    FROM categories
    WHERE Cat_Name = CatName;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION generate_random_hash()
RETURNS VARCHAR(64) -- Assuming SHA-256, which produces 64-character hashes
DETERMINISTIC
NO SQL
BEGIN
    DECLARE random_value VARCHAR(255);
    DECLARE hashed_value VARCHAR(64);

    -- Generate a random value
    SET random_value = CONCAT(RAND(), UUID());

    -- Calculate the SHA-256 hash of the random value
    SET hashed_value = SHA2(random_value, 256);

    RETURN hashed_value;
END //
DELIMITER ;

-- New Procedures as of 11/19

DELIMITER //
CREATE PROCEDURE GetHashyPassy(IN pt_user VARCHAR(20), pt_pass VARCHAR(64))
BEGIN
SET @input_password := pt_pass; 
SET @salt := (SELECT Salt FROM logincreds WHERE Username = pt_user); 
SET @hashed_input_password := SHA2(CONCAT(@input_password, @salt), 224); 
SELECT Username FROM logincreds WHERE Username = pt_user AND HashPass = @hashed_input_password; 
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RegisterUser(IN pt_user VARCHAR(20), pt_pass VARCHAR(64), ID INT)
BEGIN
SET @provideduser := pt_user; 
SET @userpassword := pt_pass;
SET @userid := ID; 
SET @salt := generate_random_hash();
SET @hashed_password := SHA2(CONCAT(@userpassword, @salt), 224);
INSERT INTO logincreds (Username, HashPass, Salt, Employee_ID) VALUES (@provideduser, @hashed_password, @salt, @userid);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertNewProduct(IN i VARCHAR(45), n VARCHAR(45), p FLOAT, q INT, d VARCHAR(255))
BEGIN
SET @Category := i;
SET @pname := n;
SET @pprice := p;
SET @pqty := q;
SET @pdesc := d;
CALL GetCatID(@Category, @CatID);
INSERT INTO products
Values (0, @CatID, @pname, @pprice, @pqty, @pdesc);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE UpdateProduct(IN i VARCHAR(45), n VARCHAR(45), p FLOAT, q INT, d VARCHAR(255))
BEGIN
SET @pid := i;
SET @pname := n;
SET @pprice := p;
SET @pqty := q;
SET @pdesc := d;
UPDATE products
SET Prod_Name = @pname, Prod_Price = @pprice, Prod_qty = @pqty, Prod_Desc = @pdesc
WHERE Product_ID = @pid;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteProduct(IN i INT)
BEGIN
SET @pid := i;
DELETE FROM products
WHERE Product_ID = @pid;
END //
DELIMITER ;
