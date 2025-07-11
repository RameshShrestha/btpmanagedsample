sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/ramesh/manageemployee/test/integration/FirstJourney',
		'com/ramesh/manageemployee/test/integration/pages/EmployeesList',
		'com/ramesh/manageemployee/test/integration/pages/EmployeesObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeesList, EmployeesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/ramesh/manageemployee') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEmployeesList: EmployeesList,
					onTheEmployeesObjectPage: EmployeesObjectPage
                }
            },
            opaJourney.run
        );
    }
);