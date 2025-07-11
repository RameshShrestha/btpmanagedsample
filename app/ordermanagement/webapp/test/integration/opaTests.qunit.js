sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/ramesh/ordermanagement/test/integration/FirstJourney',
		'com/ramesh/ordermanagement/test/integration/pages/OrdersList',
		'com/ramesh/ordermanagement/test/integration/pages/OrdersObjectPage',
		'com/ramesh/ordermanagement/test/integration/pages/Orders_ItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrdersList, OrdersObjectPage, Orders_ItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/ramesh/ordermanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrdersList: OrdersList,
					onTheOrdersObjectPage: OrdersObjectPage,
					onTheOrders_ItemsObjectPage: Orders_ItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);