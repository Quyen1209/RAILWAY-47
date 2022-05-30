-- Viết 1 query lấy thông tin "Name" từ bảng Production.Product có name của ProductSubcategory là 'Saddles'.
WITH CTE_ProductSubcategoryID_of_Saddles as
(
SELECT	ProductSubcategoryID
FROM	productsubcategory
WHERE	Name like 'Saddles'
)
SELECT	Name
FROM	product
WHERE	ProductSubcategoryID = (SELECT * FROM CTE_ProductSubcategoryID_of_Saddles);

-- Question 2: Thay đổi câu Query 1 để lấy được kết quả sau.

SELECT	`Name`
FROM	product
WHERE	substring_index(substring_index(`Name`, ' ', 2), ' ', -1) like 'Bo%' and length(Name) > 15;


-- Question 3: Viết câu query trả về tất cả các sản phẩm có giá rẻ nhất (lowest ListPrice) và Touring Bike (nghĩa là ProductSubcategoryID = 3)

WITH CTE_Lowest_ListPrice as
(
SELECT	Min(ListPrice)
FROM	product
WHERE	ProductSubcategoryID = 3
)
SELECT Name
FROM	product
WHERE	ListPrice = (SELECT * FROM CTE_Lowest_ListPrice);

-- Exercise 2: JOIN nhiều bảng 
-- Question 1: Viết query lấy danh sách tên country và province được lưu trong AdventureWorks2008sample database.
SELECT C.Name, P.Name
FROM	countryregion as C
JOIN	stateprovince as P on C.CountryRegionCode = P.CountryRegionCode;

-- Question 2: Tiếp tục với câu query trước và thêm điều kiện là chỉ lấy country Germany và Canada
SELECT 		C.Name, P.Name
FROM		countryregion as C
JOIN		stateprovince as P on C.CountryRegionCode = P.CountryRegionCode
where		C.Name in ('Germany','Canada')
ORDER BY	C.Name, P.Name ASC;

-- Question 3: {Từ bảng SalesPerson, chúng ta lấy cột BusinessEntityID (là định danh của người
-- sales), Bonus and the SalesYTD (là đã sale được bao nhiêu người trong năm nay)
-- Từ bảng SalesOrderHeader, chúng ta lấy cột SalesOrderID OrderDate}

SELECT	SP.SalesPersonID, SP.Bonus, SP.SalesYTD, SOH.SalesOrderID, SOH.OrderDate
FROM	salesperson SP 
JOIN	salesorderheader SOH on SP.SalesPersonID = SOH.SalesPersonID;

-- Question 4: Sử dụng câu query ở question 3, thêm cột JobTitle and xóa cột SalesPersonID và BusinessEntityID.
SELECT	SP.Bonus, SP.SalesYTD, SOH.SalesOrderID, SOH.OrderDate, E.Title
FROM	salesperson SP 
JOIN	salesorderheader SOH on SP.SalesPersonID = SOH.SalesPersonID
JOIN	employee E on SP.SalesPersonID = E.EmployeeID;