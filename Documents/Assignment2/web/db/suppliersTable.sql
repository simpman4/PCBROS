CREATE TABLE SUPPLIERS (
    ID INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 301,  INCREMENT BY 1),
    CONTACTNAME VARCHAR(30),
    COMPANYNAME VARCHAR(50) UNIQUE,
    EMAIL VARCHAR(50) UNIQUE,
    STREET VARCHAR(50),
    SUBURB VARCHAR(30),
    STATE VARCHAR(3),
    POSTCODE VARCHAR(4),
    STATUS BOOLEAN
);

