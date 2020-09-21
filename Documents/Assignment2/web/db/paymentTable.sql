/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Joshua
 * Created: 7 Jun 2020
 */

CREATE TABLE PAYMENT (
    CARDNUMBER VARCHAR(50) UNIQUE,
    PAYMENTMETHOD VARCHAR(60),
    CVC VARCHAR(60),
    EXPIRYDATE VARCHAR(60)
);