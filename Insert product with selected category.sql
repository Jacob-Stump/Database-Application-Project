-- Call the procedure to retrieve Category_ID
CALL GetCatID('Tool', @CatID);

-- Use the captured Category_ID for seperate query(INSERT INTO)
INSERT INTO project.products (Category_ID, Prod_Name, Prod_Price, Prod_Qty, Prod_Desc)
VALUES (@CatID, 'New toy', 50, 100, 'Shiny');
