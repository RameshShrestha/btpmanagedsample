using { Currency, managed, cuid } from '@sap/cds/common';
namespace myorder;

entity Orders : cuid, managed {
  OrderNo  : String(44) @title:'Order Number'; //> readable key
  Items    : Composition of many {
    key ID    : UUID @title:'ID';
    product   : Association to Products;
    quantity  : Integer @title:'Quantity';
    title     : String @title:'Title'; //> intentionally replicated as snapshot from product.title
    price     : Double @title:'Price'; //> materialized calculated field
    currency : Currency @title:'Currency';
  };
  employeeId : Association to Employee @mandatory @title:'Employee ID';
  customerId : Association to Customers @title:'Customer';
 totalPrice : Double @title:'Total Price';
  currency : Currency @title:'Currency';
}

/** This is a stand-in for arbitrary ordered Products */
entity Products {
  key ID : String @title:'Product ID';
  productName : String @title:'Product Name';
  stock : Integer @title:'Stock';
  UnitPrice  : Double @title:'Unit Price';
  currency : Currency @title:'Currency';

}
entity Employee : managed {
  key ID       : Integer @title:'Employee ID';
  name         : String(111) @mandatory @title:'Employee Name';
  dateOfBirth  : Date @title:'Date of Birth';
 
  orders        : Association to many Orders on orders.employeeId = $self;
}
entity Customers : managed{
    key CustomerID : Integer @title:'Customer ID';
    customerName : String @title:'Customer Name ';
    phoneNo : String @title:'Phone No.';
}



