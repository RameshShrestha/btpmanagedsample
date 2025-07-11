sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.ramesh.ordermanagement',
            componentId: 'Orders_ItemsObjectPage',
            contextPath: '/Orders/Items'
        },
        CustomPageDefinitions
    );
});