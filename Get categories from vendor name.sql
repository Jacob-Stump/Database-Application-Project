-- Call the procedure to retrieve Vendor_ID
CALL GetVendorID('Eric', @VendorID);

-- Use the captured Vendor_ID for separate query(Generate associated vendors in drop down)
SELECT Cat_Name
FROM categories
WHERE Vendor_ID = @VendorID;
