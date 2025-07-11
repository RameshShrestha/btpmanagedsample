using { myorder} from '../db/schema';
service OrderService {

    entity Customers as projection on myorder.Customers;
    entity Employees as projection on myorder.Employee;
    entity Orders as projection on myorder.Orders;
    entity Products as projection on myorder.Products;
 
   
 annotate Orders with @odata.draft.enabled;
annotate Products with @odata.draft.enabled;
annotate Employees with @odata.draft.enabled;
annotate Customers with @odata.draft.enabled;


}