sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"employee/test/integration/pages/EmployeesList",
	"employee/test/integration/pages/EmployeesObjectPage",
	"employee/test/integration/pages/SkillsObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, SkillsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('employee') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheSkillsObjectPage: SkillsObjectPage
        },
        async: true
    });

    return runner;
});

