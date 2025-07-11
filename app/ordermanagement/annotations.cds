using OrderService as service from '../../srv/orderservice';
annotate service.Orders with @(
    UI.SelectionFields : [OrderNo,createdAt,employeeId_ID],
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : OrderNo,
            },
            {
                $Type : 'UI.DataField',
                Value : employeeId_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : customerId_CustomerID,
            },
            
            {
                $Type : 'UI.DataField',
                Value : currency_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {$Type: 'UI.ReferenceFacet', Label: '{i18n>OrderItems}', Target: 'Items/@UI.LineItem'},
        
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : OrderNo,
        },
        {
            $Type : 'UI.DataField',
            Value : employeeId_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : customerId_CustomerID,
        },
       
        {
            $Type : 'UI.DataField',
            Value : currency_code,
        },
          {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
         {
            $Type : 'UI.DataField',
            Value : totalPrice,
        },
    ],
);

annotate service.Orders with {
    employeeId @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Employees',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : employeeId_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'dateOfBirth',
            },
        ],
    }
};

annotate service.Orders with {
    customerId @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Customers',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : customerId_CustomerID,
                ValueListProperty : 'CustomerID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'customerName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phoneNo',
            },
        ],
    }
};

annotate service.Orders.Items with @(
	UI: {
		LineItem: [
			{Value: product_ID, Label:'{i18n>ProductID}'},
			{Value: title, Label:'Title'},
			{Value: price, Label:'{i18n>Price}'},
			{Value: quantity, Label:'{i18n>Quantity}'},
		],
		Identification: [ //Is the main field group
            {Value: product_ID, Label:'{i18n>ProductID}'},
            {Value: title, Label:'{i18n>Product}'},
			{Value: quantity, Label:'{i18n>Quantity}'},
			{Value: price, Label:'{i18n>Price}'},
            {Value: currency_code, Label:'{i18n>Currency}'},
		],
		Facets: [
			{$Type: 'UI.ReferenceFacet', Label: '{i18n>OrderItems}', Target: '@UI.Identification'},
		],
	},
);