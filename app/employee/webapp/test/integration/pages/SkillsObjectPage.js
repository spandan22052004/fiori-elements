sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'employee',
            componentId: 'SkillsObjectPage',
            contextPath: '/Employees/to_Skills'
        },
        CustomPageDefinitions
    );
});