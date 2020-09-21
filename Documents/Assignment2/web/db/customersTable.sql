CREATE TABLE CUSTOMERS (
    ID INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 101,  INCREMENT BY 1),
    EMAIL VARCHAR(50) UNIQUE,
    PASSWORD VARCHAR(50),
    FULLNAME VARCHAR(50),
    STREET VARCHAR(50),
    SUBURB VARCHAR(30),
    STATE VARCHAR(3),
    POSTCODE VARCHAR(4),
    DOB DATE,
    PHONENUM VARCHAR(10)
);

