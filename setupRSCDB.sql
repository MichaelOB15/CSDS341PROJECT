



CREATE TABLE RESTAURANT
( 
restaurantid		INT NOT NULL,
restaurantName		CHAR(50) NOT NULL, 
restaurantlocation  CHAR(50) NOT NULL,
CONSTRAINT PK_RESTAURANT		PRIMARY KEY (restaurantid)
)

CREATE TABLE MENU
( 
menuid			INT NOT NULL,
restaurantid	INT NOT NULL,
CONSTRAINT PK_MENU		PRIMARY KEY(menuid),
CONSTRAINT FK_M_REST	FOREIGN KEY( restaurantid)
REFERENCES RESTAURANT(restaurantid) 
ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE CUSTORDER
( 
orderid			INT NOT NULL,
restaurantid	INT NOT NULL,
customerName	CHAR(50) NOT NULL, 
dateOfOrder		DATE NOT NULL,
timeOfOrder		TIME NOT NULL,
CONSTRAINT PK_CUSTORDER	PRIMARY KEY(orderid),
CONSTRAINT FK_CO_REST	FOREIGN KEY( restaurantid)
REFERENCES RESTAURANT(restaurantid)
ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE INGREDIENT
( 
ingredientid	INT NOT NULL,
ingredientName	CHAR(50) NOT NULL, 
expirationDate	DATE NOT NULL,
CONSTRAINT PK_INGREDIENT	PRIMARY KEY(ingredientid)
)

CREATE TABLE ITEM
( 
itemid			INT NOT NULL,
itemName        CHAR(50) NOT NULL, 
menuid			INT NOT NULL,
price           FLOAT NOT NULL,
CONSTRAINT PK_ITEM		PRIMARY KEY( itemid), 
CONSTRAINT FK_I_MENU	FOREIGN KEY( menuid)
REFERENCES MENU (menuid)
ON DELETE CASCADE ON UPDATE CASCADE
)


CREATE TABLE ITEMSOFCUSTORDER
( 
itemid			INT NOT NULL,
orderid			INT NOT NULL, 
amount			INT NOT NULL,
CONSTRAINT PK_ITEMSOFCUSTORDER	PRIMARY KEY(itemid, orderid),
CONSTRAINT FK_IC_ITEM			FOREIGN KEY(itemid)
REFERENCES ITEM(itemid)
ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT FK_IC_CUST			FOREIGN KEY(orderid)
REFERENCES CUSTORDER(orderid)
ON DELETE NO ACTION ON UPDATE NO ACTION
)



CREATE TABLE INVENTORY
( 
ingredientid    INT NOT NULL,
restaurantid    INT NOT NULL,  
stock			INT NOT NULL,
CONSTRAINT PK_INVENTORY		PRIMARY KEY(ingredientid, restaurantid),
CONSTRAINT FK_I_INGRED		FOREIGN KEY(ingredientid)
REFERENCES INGREDIENT(ingredientid)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_I_REST        FOREIGN KEY( restaurantid)
REFERENCES RESTAURANT(restaurantid)
ON DELETE CASCADE ON UPDATE CASCADE
)

CREATE TABLE INGREDIENTSOFITEM
( 
ingredientid    INT NOT NULL,
itemid			INT NOT NULL, 
CONSTRAINT PK_INGREDIENTSOFITEM		PRIMARY KEY(ingredientid, itemid),
CONSTRAINT FK_II_INGRED				FOREIGN KEY(ingredientid)
REFERENCES INGREDIENT(ingredientid)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_II_ITEM				FOREIGN KEY( itemid)
REFERENCES ITEM(itemid)
ON DELETE CASCADE ON UPDATE CASCADE
)




