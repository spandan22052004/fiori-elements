sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/EmployeesList",
	"project1/test/integration/pages/EmployeesObjectPage",
	"project1/test/integration/pages/SkillsObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage, SkillsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage,
			onTheSkillsObjectPage: SkillsObjectPage
        },
        async: true
    });

    return runner;
});

