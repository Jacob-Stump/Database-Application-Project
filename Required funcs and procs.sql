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


/*--Broken
DELIMITER //
CREATE PROCEDURE GetCategoryID(IN CatName CHAR(45), OUT CatID INT)
BEGIN
    SELECT Category_ID
    INTO CatID
    FROM categories
    WHERE Cat_Name = CatName;
END //
DELIMITER ;
*/

DELIMITER //
CREATE PROCEDURE GetCatID(IN CatName CHAR(45), OUT CatID INT)
BEGIN
    SELECT Category_ID
    INTO CatID
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


