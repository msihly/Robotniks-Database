/* Create tables */
CREATE TABLE Manufacturer (
    ManufacturerID 		AUTOINCREMENT NOT NULL,
    ManufacturerName	VARCHAR(75),
    Street				VARCHAR(30),
    City				VARCHAR(30),
    State				VARCHAR(30),
    ZipCode           	VARCHAR(10),
    PhoneNumber			VARCHAR(15),
    Email				VARCHAR(50),
        PRIMARY KEY (ManufacturerID)
);

CREATE TABLE Product (
    ProductID				AUTOINCREMENT NOT NULL,
    ManufacturerID			LONG NOT NULL,
    ProductName				VARCHAR(100),
    Description				LONGTEXT,
    PartNumber        		VARCHAR(50),
    WarrantyPolicy			LONGTEXT,
    ReturnPolicy			LONGTEXT,
    SuggestedRetailPrice	DOUBLE,
    AverageRating			DOUBLE,
        PRIMARY KEY (ProductID)
);

CREATE TABLE Services (
    ServiceID 			AUTOINCREMENT NOT NULL,
    ServiceName       	VARCHAR(255),
    ServiceDuration		VARCHAR(255),
    ServicePrice		DOUBLE,
        PRIMARY KEY (ServiceID)
);

CREATE TABLE Employee (
    EmployeeID 			AUTOINCREMENT NOT NULL,
    FirstName			VARCHAR(50),
    LastName			VARCHAR(50),
    Street				VARCHAR(30),
    City				VARCHAR(30),
    State				VARCHAR(30),
    ZipCode           	VARCHAR(10),
    PhoneNumber			VARCHAR(15),
    Email				VARCHAR(50),
    AccountNumber		VARCHAR(15),
    RoutingNumber		VARCHAR(15),
    DiscountLimit		DOUBLE,
    CommissionPercent	DOUBLE,
    AnnualSalary		DOUBLE,
    BonusQuota			DOUBLE,
    BonusPaid			DOUBLE,
        PRIMARY KEY (EmployeeID)
);

CREATE TABLE Customer (
    CustomerID		AUTOINCREMENT NOT NULL,
    FirstName		VARCHAR(50),
    LastName		VARCHAR(50),
    Street			VARCHAR(30),
    City			VARCHAR(30),
    State			VARCHAR(30),
    ZipCode         VARCHAR(10),
    PhoneNumber		VARCHAR(15),
    Email			VARCHAR(50),
        PRIMARY KEY (CustomerID)
);

CREATE TABLE Orders (
    OrderID 		AUTOINCREMENT NOT NULL,
    CustomerID		LONG NOT NULL,
    EmployeeID		LONG NOT NULL,
    PaymentType		VARCHAR(50),
    PaymentAmount	DOUBLE,
    DatePlaced      DATE,
        PRIMARY KEY (OrderID)
);

CREATE TABLE OrderItem (
    LineItemNumber	LONG NOT NULL,
    OrderID			LONG NOT NULL,
    ProductID		LONG NOT NULL,
    Quantity		LONG,
    PricePaid		DOUBLE,
        PRIMARY KEY (LineItemNumber, OrderID)
);

CREATE TABLE ServiceRendered (
    OrderID			LONG NOT NULL,
    ServiceID		LONG NOT NULL,
    EmployeeID		LONG NOT NULL,
    StartTime		TIME,
    EndTime       	TIME,
    StartDate		DATE,
    EndDate			DATE,
    PricePaid		DOUBLE,
        PRIMARY KEY (OrderID, ServiceID)
);

/* Create foreign key relationships */
ALTER TABLE Product
    ADD CONSTRAINT fk_product_manufacturer
        FOREIGN KEY (ManufacturerID) REFERENCES Manufacturer (ManufacturerID);

ALTER TABLE Orders
    ADD CONSTRAINT fk_order_customer
        FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
    CONSTRAINT fk_order_employee
        FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

ALTER TABLE OrderItem
    ADD CONSTRAINT fk_orderitem_order
        FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    CONSTRAINT fk_orderitem_product
        FOREIGN KEY (ProductID) REFERENCES Product (ProductID);

ALTER TABLE ServiceRendered
    ADD CONSTRAINT fk_servicerendered_order
        FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    CONSTRAINT fk_servicerendered_service
        FOREIGN KEY (ServiceID) REFERENCES Services (ServiceID),
    CONSTRAINT fk_servicerendered_employee
        FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID);

/* INSERT - Manufacturer Table */
INSERT INTO Manufacturer (ManufacturerName, Street, City, State, ZipCode, PhoneNumber, Email)
    VALUES ('MSI Computer Corp.', '901 Canada Court', 'City of Industry', 'CA', '91748', '1-626-913-0828', 'USsales@msi.com');

INSERT INTO Manufacturer (ManufacturerName, Street, City, State, ZipCode, PhoneNumber)
    VALUES ('Intel Corporation', '2200 Mission College Blvd.', 'Santa Clara', 'CA', '95054', '1-408-765-8080');

INSERT INTO Manufacturer (ManufacturerName, Street, City, State, ZipCode, PhoneNumber)
    VALUES ('Advanced Micro Devices, Inc.', '2485 Augustine Drive', 'Santa Clara', 'CA', '95054', '1-877-284-1566');

INSERT INTO Manufacturer (ManufacturerName, Street, City, State, ZipCode, PhoneNumber, Email)
    VALUES ('Nvidia Corporation', '2788 San Tomas Expressway', 'Santa Clara', 'CA', '95051', '1-408-486-2000', 'info@nvidia.com');

INSERT INTO Manufacturer (ManufacturerName, Street, City, State, ZipCode, PhoneNumber)
    VALUES ('Western Digital Corporation', '5601 Great Oaks Parkway', 'San Jose', 'CA', '95119', '1-408-717-6000');

INSERT INTO Manufacturer (ManufacturerName, Street, City, State, ZipCode, PhoneNumber)
    VALUES ('HP Inc.', '1501 Page Mill Road', 'Palo Alto', 'CA', '94304', '1-650-857-1501');

/* INSERT - Product Table */
INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('1', 'MSI B450 Gaming Pro Carbon AC AM4 ATX AMD Motherboard', 'Customize and set up your own color scheme with MSI Mystic Light utility. Cooling your PC is ' +
            'essential for reliable performance. Outsmart and outperform your opponents in-game using an array of unique MSI GAMING tools.', 'B450 GAMING PRO CARBON', 'Vendor Warranty:'
            + CHR(13)+CHR(10) + 'Parts: 3 Years' + CHR(13)+CHR(10) + 'Labor: 3 Years', 'May be returned within 15 days of purchase*', 139.99, 5.0);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('1', 'MSI Ventus GeForce RTX 2060 Overclocked Dual-Fan 6GB GDDR6 PCIe Video Card', 'A fresh new dual fan design, VENTUS proudly displays its industrial shapes in ' +
            'neutral colors to fit any build. Using two of the award-winning TORX Fans 2.0, MSI VENTUS graphics cards provide years of top-notch cooling performance.', 'RTX 2060 VENTUS 6G OC',
            'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 3 Years' + CHR(13)+CHR(10) + 'Labor: 3 Years', 'May be returned within 30 days of purchase*', 359.99, 5.0);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('1', 'MSI Gaming X Trio GeForce RTX 2080 Ti Triple-Fan 11GB GDDR6 PCIe Video Card', 'When it comes to next-gen gaming, its all about realism. GeForce RTX 2080 is ' +
            'light years ahead of other cards, delivering truly unique real-time ray-tracing technologies for cutting-edge, hyper-realistic graphics. GeForce RTX graphics cards ' +
            'are powered by the Turing GPU architecture and the all-new RTX platform. This gives you up to 6X the performance of previous-generation graphics cards and brings the ' +
            'power of real-time ray tracing and AI to games.', 'RTX2080TiGAMINGXTRIO', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 3 Years' + CHR(13)+CHR(10) + 'Labor: 3 Years',
            'May be returned within 30 days of purchase*', 1349.99, 4.6);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('2', 'Intel Core i9-9900K Coffee Lake 3.6 GHz LGA 1151 Boxed Processor', 'Introducing the NEW 9th Gen Intel Core desktop processors the first unlocked mainstream desktop ' +
            'processor. When paired with Intel Optane memory, accelerates the loading and launching of the games you play. With up to 5GHz and 16-way multitasking, take your creativity ' +
            'to the next level with the power you need to create, edit, and share.', 'BX80684I99900K', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 3 Years' + CHR(13)+CHR(10) + 'Labor: 3 Years',
            'May be returned within 15 days of purchase*', 699.99, 5.0);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('2', 'Intel 660p 512GB 3D NAND QLC M.2 2280 PCIe NVMe 3.0 x4 Internal Solid State Drive', 'Meet todays storage needs and prepare for the growing demands of tomorrow with the ' +
            'Intel SSD 660p Series built on Intel QLC 3D NAND technology. The Intel SSD 660p is the first QLC-based client PCIe SSD in the industry, continuing Intels leadership in flash ' +
            'cell technology and quality manufacturing. The SSD 660p finally fits low-cost and high-capacity into one drive.', 'SSDPEKNW512G8XT', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 5 Years Limited'
            + CHR(13)+CHR(10) + 'Labor: 5 Years Limited', 'May be returned within 15 days of purchase*', 69.99, 4.9);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('3', 'AMD Ryzen 7 2700X 3.7GHz 8 Core AM4 Boxed Processor with Wraith Prism Cooler', 'Featuring the Highest Multiprocessing Performance You Can Get on Mainstream Desktop PC. Higher ' +
            'performance. Incredible technology. Intelligent Ryzen processors just got even smarter. AMDs ultimate cooling solution for Ryzen 7 processors features per-RGB light control, ' +
            'direct-contact heat pipes, and a thin profile for improved compatibility. Get yours, exclusively bundled with the new 2nd Gen AMD Ryzen 7 2700X. AMDs future-proof mainstream ' +
            'computing platform, updated with the new X470 chipset. Note that 300-series motherboards may require a BIOS flash to be compatible with Ryzen Desktop 2000-series processors.',
            'YD270XBGAFBOX', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 3 Years' + CHR(13)+CHR(10) + 'Labor: 3 Years', 'May be returned within 15 days of purchase*', 319.99, 4.9);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('3', 'AMD Ryzen Threadripper 2920X 3.5GHz 12 Core TR4 Boxed Processor', 'Created for gaming enthusiasts, content creators and developers, Threadripper 2920X processors delivers exceptional ' +
            'performance in every field.', 'YD292XA8AFWOF', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 3 Years' + CHR(13)+CHR(10) + 'Labor: 3 Years', 'May be returned within 15 days of purchase*', 649.99, 5.0);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('3', 'AMD Athlon 200GE 3.2GHz Dual Core AM4 Boxer Processor with Radeon Vega 3 Graphics', 'The most advanced entry-level processor AMD has ever created, for users who value fast responsiveness ' +
            'and built-in Radeon Vega Graphics, with the cutting-edge processor architecture you need to take advantage of graphics card upgrades. Note that 300-series motherboards may require a BIOS flash to be ' +
            'compatible with Ryzen Desktop 2000-series processors.', 'YD200GC6FBBOX', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 3 Years' + CHR(13)+CHR(10) + 'Labor: 3 Years', 'May be returned within 15 days of purchase*', 54.99, 4.8);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('4', 'NVIDIA SHIELD TV Streaming Media Player w/ Controller and Remote', 'NVIDIA SHIELD TV is the streamer for gamers. The fastest, smoothest 4K HDR video gives you limitless entertainment with all ' +
            'the essential apps, including Amazon Video, Netflix, YouTube, Spotify, and more. SHIELD is a streaming beast thats 3X faster than the closest competitor. Game on GeForce NOW to stream hit PC games ' +
            'from the cloud, instantly. Or cast your games from a GeForce GTX rig to the comfort of your living room. And control every experience with your voice, even your home. Dim the lights, order an Uber, ' +
            'or change the temperature. SHIELD is everything you want in one game-changing device. Plug headphones into controller for private listening.', '945128972500001', 'Vendor Warranty: 1 Year Limited',
            'May be returned within 30 days of purchase*', 199.99, 4.4);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('4', 'NVIDIA GeForce GTX 1080 Founders Edition, 8GB GDDR5X PCI Express 3.0 Graphics Card', 'NVIDIAs new flagship GeForce GTX 1080 is the most advanced gaming graphics card ever created. Discover ' +
            'unprecedented performance, power efficiency, and gaming experiences-driven by the new NVIDIA Pascal architecture. This is the ultimate gaming platform. 8GB GDDR5X memory; PCI Express 3.0; HDMI, ' +
            'DVI-D and DisplayPort outputs; 1607MHz clock speed; 256-bit memory', '900-1G413-2500-00', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 1 Year' + CHR(13)+CHR(10) + 'Labor: 1 Year',
            'May be returned within 30 days of purchase*', 599.99, 4.7);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('5', 'WD Blue 1TB 3D NAND SATA III 6Gb/s 2.5" Internal Solid State Drive', 'With superior performance and a leader in reliability, the WD Blue SSD offers digital storage that is optimized for ' +
            'multi-tasking and ready to keep up with your high performance computing needs. Available in both 2.5"/7mm cased form factor and WDs Functional Integrity Testing Lab (FIT Lab), the WD Blue SSD ' +
            'is compatible with a wide range of computers, so you can be sure you are making the right choice. Combined with the free, downloadable WD SSD Dashboard and a 3-year limited warranty, you can ' +
            'confidently upgrade your system to the WD Blue SSD.', 'WDBNCE0010PNC-W', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 3 Years Limited' + CHR(13)+CHR(10) + 'Labor: 3 Years Limited',
            'May be returned within 30 days of purchase*', 149.99, 5.0);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('5', 'WD My Cloud EX2 Ultra 4TB 2-Bay Network Attached Storage (NAS) - Charcoal Gray', 'Keep your media safe in a single place on this high-performance NAS solution, and access it securely from ' +
            'anywhere. With My Cloud EX2 Ultra, you''ll be able to automatically sync content across computers, easily share files and folders, and enjoy multiple backup options so you can create your own ' +
            'personalized system with ease.', 'WDBVBZ0040JCH-NESN', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 3 Years Limited' + CHR(13)+CHR(10) + 'Labor: 3 Years Limited',
            'May be returned within 30 days of purchase*', 369.99, 4.7);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('5', 'WD My Passport 4TB USB 3.0 2.5" Portable External Hard Drive - Blue', 'My Passport is a sleek, powerful and secure little device. Behind the colorful exterior are seven generations of ' +
            'innovation and reliability. Millions of people around the world choose My Passport as their portable hard drive. Maybe you should, too.', 'WDBYFT0040BBL-W', 'Vendor Warranty:' + CHR(13)+CHR(10) +
            'Parts: 3 Years Limited' + CHR(13)+CHR(10) + 'Labor: 3 Years Limited', 'May be returned within 30 days of purchase*', 129.99, 4.4);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice, AverageRating)
    VALUES ('6', 'HP ProBook 6470B 14" Laptop Computer Refurbished - Black', 'The refurbished ProBook 6470b features a 14-inch diagonal display and Intel Core i5-3320M processor. From the professional ' +
            'design to the Intel technology, you''re ready for business.', 'KIT-HP-55826', 'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 90 Days Limited' + CHR(13)+CHR(10) + 'Labor: 90 Days Limited',
            'May be returned within 15 days of purchase*', 189.99, 3.1);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, ReturnPolicy, SuggestedRetailPrice)
    VALUES ('6', 'HP 63 Black/Tri-color Ink Cartridge Combo Pack', 'Create lab-quality color photos and everyday documents with Original HP ink cartridges-designed with fraud protection and smart low-ink ' +
            'alerts to deliver worry-free performance and consistent results you can count on. Want more pages, great reliability, and amazing value? You want original HP inks.', 'L0R46AN#140',
            'May be returned within 30 days of purchase*', 47.99);

INSERT INTO Product (ManufacturerID, ProductName, Description, PartNumber, WarrantyPolicy, ReturnPolicy, SuggestedRetailPrice)
    VALUES ('6', 'HP EliteDesk 705 G1 Desktop Computer (Refurbished) AMD A8-7600 Processor 3.1GHz', 'Designed to perform and impress - this HP EliteDesk 705 G1 desktop computer (refurbished) helps you power ' +
            'through to business success.', 'KIT-HP-55828',	'Vendor Warranty:' + CHR(13)+CHR(10) + 'Parts: 90 Days Limited' + CHR(13)+CHR(10) + 'Labor: 90 Days Limited', 'May be returned within 15 days of purchase*', 219.99);

/* INSERT - Employee Table */
INSERT INTO Employee (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email, AccountNumber,
                      RoutingNumber, DiscountLimit, CommissionPercent, AnnualSalary, BonusQuota, BonusPaid)
    VALUES ('Mohamed', 'Sihly', '603 Foch Blvd.', 'Williston Park', 'NY', '11596', '1-516-765-6876', 'mohamed.sihly@baruchmail.cuny.edu', '6411307358',
            '008723194', 2, 0.0137, 54800, 10000, 0.04);

INSERT INTO Employee (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email, AccountNumber,
                      RoutingNumber, DiscountLimit, CommissionPercent, AnnualSalary, BonusQuota, BonusPaid)
    VALUES ('Mantaqaa', 'Khan', '545 St. Marks Ave.', 'Crown Heights', 'NY', '12542', '1-718-723-1880', 'mkhan4646@bths.edu', '3078129614',
            '003409125', 2, 0.0130, 49000, 10000, 0.04);

INSERT INTO Employee (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email, AccountNumber,
                      RoutingNumber, DiscountLimit, CommissionPercent, AnnualSalary, BonusQuota, BonusPaid)
    VALUES ('Tatsiana', 'Mikhalchyk', 'East 22nd St.', 'New York', 'NY', '10010', '1-212-043-4224', 'tmikhalchyk@gmail.com', '4310701719',
            '004310795', 4, 0.005, 72500, 13000, 0.025);

INSERT INTO Employee (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email, AccountNumber,
                      RoutingNumber, DiscountLimit, CommissionPercent, AnnualSalary, BonusQuota, BonusPaid)
    VALUES ('Andrew', 'Chu', '544 Union Ave.', 'Brooklyn', 'NY', '11211', '1-718-387-2281', 'andrew.chu2@baruchmail.cuny.edu', '5128706220',
            '001535731', 2, 0.010, 46000, 10000, 0.03);

INSERT INTO Employee (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email, AccountNumber,
                      RoutingNumber, DiscountLimit, CommissionPercent, AnnualSalary, BonusQuota, BonusPaid)
    VALUES ('Anika', 'Pancho', '169 Water St.', 'Brooklyn', 'NY', '11211', '1-718-591-8246', 'anivpancho@gmail.com ', '2196510553',
            '004254237', 3, 0.005, 42000, 8000, 0.035);

/* INSERT - Customer Table */
INSERT INTO Customer (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email)
    VALUES ('Alexander', 'Kim', '64 Country Village Dr.', 'Herricks', 'NY', '11590', '1-516-202-3953', 'akim69@gmail.com');

INSERT INTO Customer (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email)
    VALUES ('Samantha', 'Karle', '154 Colonial Blvd.', 'Providence', 'RI', '02860', '1-401-791-5053', 'samkarle@gmail.com');

INSERT INTO Customer (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email)
    VALUES ('Pranshu', 'Babbles', '4 Emmy St.', 'Denton', 'NY', '11590', '1-613-351-1517', 'pbab@gmail.com');

INSERT INTO Customer (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email)
    VALUES ('Rebecca', 'Kimchi', '7 Sunset Dr.', 'Albertson', 'NY', '11596', '1-516-900-1691', 'rebby1398@gmail.com');

INSERT INTO Customer (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email)
    VALUES ('Habeen', 'Jun', '33 Omaha Ave.', 'Stony Brook', 'NY', '11733', '1-613-765-1964', 'dan17@gmail.com');

INSERT INTO Customer (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email)
    VALUES ('Joe', 'D''Arpino', 'Mulbery Dr.', 'Boston', 'MA', '02109', '1-617-429-7034', 'joseph.darpino@bu.edu');

INSERT INTO Customer (FirstName, LastName, Street, City, State, ZipCode, PhoneNumber, Email)
    VALUES ('Mohamed', 'Sihly', '676 Serpentine Ln.', 'Williston Park', 'NY', '11596', '1-516-760-6806', 'mohamed.sihly@gmail.com');

/* INSERT - Services Table */
INSERT INTO Services (ServiceName, ServiceDuration, ServicePrice)
    VALUES ('Virus & Malware Scanning and Removal', '1 - 3 Hours (Duration may vary by device type and model)', 79.99);

INSERT INTO Services (ServiceName, ServiceDuration, ServicePrice)
    VALUES ('Hard Drive Backup & Protection', 'SSD - 1 Hour per 500 GB of Data' + CHR(13)+CHR(10) + 'HDD - 1 Hour per 200 GB of Data' + CHR(13)+CHR(10) + '*Duration may vary by device type and model', 79.99);

INSERT INTO Services (ServiceName, ServiceDuration, ServicePrice)
    VALUES ('Data Recovery', 'Minimum 8 Hours - Maximum 2 Days', 299.99);

INSERT INTO Services (ServiceName, ServiceDuration, ServicePrice)
    VALUES ('Laptop Repair', 'Minimum 30 Minutes - Maximum 2 Hours', 129.99);

INSERT INTO Services (ServiceName, ServiceDuration, ServicePrice)
    VALUES ('Desktop Repair', 'Minimum 30 Minutes - Maximum 1 Hour', 99.99);

/* INSERT - Orders Table
       INSERT - OrderItem Table
       INSERT - ServiceRendered Table
    NOTE: The PricePaid is hardcoded instead of retrieved with a subquery because the scope of this project does not account for price discounts.
*/
INSERT INTO Orders (CustomerID, EmployeeID, PaymentType, DatePlaced)
    VALUES (3, 1, 'Cash', #04/21/2019#);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (0, @@IDENTITY, 15, 2, 47.99);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (1, @@IDENTITY, 13, 1, 119.99);

/* Cannot use @@IDENTITY outside of SELECT statements in Access; since you also cannot perform more than one query in Access at a time, the solution is to use VBA to store the @@IDENTITY in a variable
   and write a single statement using it. Otherwise, the value of the @@IDENTITY has to be hardcoded. However, this does not work as Access returns an error about non-updateable queries when using the
   subquery to calculate the total price. A solution to this problem was not available online. Thus, the entire PaymentAmount must be hardcoded due to the limitations of Access.
   NOTE: The PaymentAmount subquery is multiplied by 1.08 to simulate sales tax.

    UPDATE  Orders
    SET     PaymentAmount = (
                SELECT      SUM (oi.Quantity * oi.PricePaid)
                FROM        OrderItem oi
                WHERE       oi.OrderID = @@IDENTITY
            ) * 1.08
    WHERE   OrderID = @@IDENTITY;
*/
    UPDATE  Orders
    SET     PaymentAmount = 225.97 * 1.08
    WHERE   OrderID = 1;

INSERT INTO Orders (CustomerID, EmployeeID, PaymentType, DatePlaced)
    VALUES (2, 3, 'Credit', #04/21/2019#);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (0, @@IDENTITY, 3, 2, 1199.99);

    UPDATE  Orders
    SET     PaymentAmount = 1199.99 * 1.08
    WHERE   OrderID = 2;

INSERT INTO Orders (CustomerID, EmployeeID, PaymentType, DatePlaced)
    VALUES (1, 2, 'Cash', #04/22/2019#);

    INSERT INTO ServiceRendered (OrderID, ServiceID, EmployeeID, StartTime, EndTime, StartDate, EndDate, PricePaid)
        VALUES (@@IDENTITY, 4, 4, #14:22:00#, #15:06:00#, #04/22/2019#, #04/22/2019#, 129.99);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (0, @@IDENTITY, 5, 1, 69.99);

    UPDATE  Orders
    SET     PaymentAmount = 199.98 * 1.08
    WHERE   OrderID = 3;

INSERT INTO Orders (CustomerID, EmployeeID, PaymentType, DatePlaced)
    VALUES (6, 4, 'Credit', #04/24/2019#);

    INSERT INTO ServiceRendered (OrderID, ServiceID, EmployeeID, StartTime, EndTime, StartDate, EndDate, PricePaid)
        VALUES (@@IDENTITY, 3, 4, #16:35:00#, #11:38:00#, #04/23/2019#, #04/24/2019#, 299.99);

    UPDATE  Orders
    SET     PaymentAmount = 299.99 * 1.08
    WHERE   OrderID = 4;

INSERT INTO Orders (CustomerID, EmployeeID, PaymentType, DatePlaced)
    VALUES (4, 5, 'Credit', #04/24/2019#);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (0, @@IDENTITY, 1, 1, 109.99);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (1, @@IDENTITY, 2, 2, 339.99);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (2, @@IDENTITY, 7, 1, 649.99);

    UPDATE  Orders
    SET     PaymentAmount = 1439.96 * 1.08
    WHERE   OrderID = 5;

INSERT INTO Orders (CustomerID, EmployeeID, PaymentType, DatePlaced)
    VALUES (7, 1, 'Credit', #04/25/2019#);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (0, @@IDENTITY, 6, 1, 160.00);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (1, @@IDENTITY, 1, 1, 69.99);

    INSERT INTO OrderItem (LineItemNumber, OrderID, ProductID, Quantity, PricePaid)
        VALUES (2, @@IDENTITY, 5, 1, 69.99);

    UPDATE  Orders
    SET     PaymentAmount = 299.98 * 1.08
    WHERE   OrderID = 6;

/* Queries */
/*  -This query is a less functional version of the following one.
SELECT      oi.OrderID,
            sr.OrderID,
            IIF(ISNULL(SUM (oi.Quantity * oi.PricePaid)), 0, SUM (oi.Quantity * oi.PricePaid)) AS TotalProducts,
            IIF(ISNULL(SUM (sr.PricePaid)), 0, SUM (sr.PricePaid)) AS TotalServices,
            TotalProducts + TotalServices AS TotalOrder
FROM        (
            SELECT      *
            FROM        OrderItem oi LEFT JOIN ServiceRendered sr
                            on oi.OrderID = sr.OrderID
                UNION
            SELECT      *
            FROM        OrderItem oi RIGHT JOIN ServiceRendered sr
                            on oi.OrderID = sr.OrderID
            )
GROUP BY    oi.OrderID, sr.OrderID;
*/

/* Order_Actual_Subtotals */
SELECT      o.OrderID,
            IIF(ISNULL(SUM (oi.Quantity * oi.PricePaid)), 0, SUM (oi.Quantity * oi.PricePaid)) AS TotalProducts,
            IIF(ISNULL(SUM (sr.PricePaid)), 0, SUM (sr.PricePaid)) AS TotalServices,
            TotalProducts + TotalServices AS TotalOrder
FROM        (Orders o LEFT JOIN OrderItem oi
                on o.OrderID = oi.OrderID)
            LEFT JOIN ServiceRendered sr
                on o.OrderID = sr.OrderID
GROUP BY    o.OrderID;

/* Order_MSRP_Subtotals */
SELECT      o.OrderID,
            IIF(ISNULL(SUM (oi.Quantity * p.SuggestedRetailPrice)), 0, SUM (oi.Quantity * p.SuggestedRetailPrice)) AS TotalProductsMSRP,
            IIF(ISNULL(SUM (s.ServicePrice)), 0, SUM (s.ServicePrice)) AS TotalServicesMSRP,
            TotalProductsMSRP + TotalServicesMSRP AS TotalOrderMSRP
FROM        (((Orders o LEFT JOIN OrderItem oi
                on o.OrderID = oi.OrderID)
            LEFT JOIN Product p
                on oi.ProductID = p.ProductID)
            LEFT JOIN ServiceRendered sr
                on o.OrderID = sr.OrderID)
            LEFT JOIN Services s
                on sr.ServiceID = s.ServiceID
GROUP BY    o.OrderID;

/* Order_Total_Discounts */
SELECT      o.OrderID, msrp.TotalOrderMSRP AS MSRPSubtotal, ac.TotalOrder AS ActualSubtotal, MSRPSubtotal - ActualSubtotal AS TotalDiscount
FROM        (Orders o INNER JOIN Order_Actual_Subtotals ac
                on o.OrderID = ac.OrderID)
            INNER JOIN Order_MSRP_Subtotals msrp
                on o.OrderID = msrp.OrderID;

/* Orders_Overview */
SELECT      o.OrderID, o.CustomerID, c.FirstName AS CustomerFirstName, c.LastName AS CustomerLastName,
            o.EmployeeID, e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName,
            o.PaymentType, o.PaymentAmount, o.DatePlaced
FROM        (Orders o INNER JOIN Customer c
                on o.CustomerID = c.CustomerID)
            INNER JOIN Employee e
                on o.EmployeeID = e.EmployeeID;

/* Services_Rendered */
SELECT      sr.OrderID, sr.ServiceID, s.ServiceName, sr.StartTime, sr.EndTime, sr.StartDate, sr.EndDate, sr.PricePaid,
            o.CustomerID, c.FirstName AS CustomerFirstName, c.LastName AS CustomerLastName,
            sr.EmployeeID, e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName
FROM        (((ServiceRendered sr INNER JOIN Orders o
                on sr.OrderID = o.OrderID)
            INNER JOIN Customer c
                on o.CustomerID = c.CustomerID)
            INNER JOIN Employee e
                on sr.EmployeeID = e.EmployeeID)
            INNER JOIN Services s
                on sr.ServiceID = s.ServiceID;