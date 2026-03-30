using CatalogService as service from './emp-service';

annotate service.Employees with @UI.HeaderInfo: {
  TypeName      : 'Employee',
  TypeNamePlural: 'Employees',
  Title         : {
    $Type: 'UI.DataField',
    Value: name
  },
  Description   : {
    $Type: 'UI.DataField',
    Value: role
  },
  ImageUrl      : imageUrl //  THIS IS AVATAR
};


annotate service.Employees with @UI.HeaderFacets: [
  {
    $Type : 'UI.ReferenceFacet',
    Target: '@UI.DataPoint#Status'
  },
  {
    $Type : 'UI.ReferenceFacet',
    Target: '@UI.DataPoint#Progress'
  },
  {
    $Type : 'UI.ReferenceFacet',
    Target: '@UI.FieldGroup#EmploymentType',
    Label : 'Employment Type'
  },
  {
    $Type : 'UI.ReferenceFacet',
    Target: '@UI.FieldGroup#RatingGroup',
    Label : 'Rating'
  }
];

annotate service.Employees with {
  department @Common.ValueList: {
    CollectionPath: 'Departments',
    Parameters    : [{
      $Type            : 'Common.ValueListParameterInOut',
      LocalDataProperty: department,
      ValueListProperty: 'name'
    }]
  };
};

annotate service.Employees with @UI.DataPoint #Status: {
  Value      : status,
  Criticality: criticality,
  Title      : 'Status'
};

annotate service.Employees with @UI.DataPoint #Progress: {
  Value        : progress,
  TargetValue  : 100,
  Visualization: #Progress,
  Title        : 'Employee Progress'
};

annotate service.Employees with @(UI: {
  FieldGroup #EmploymentType: {Data: [{
    Label: 'Type of Employment',
    Value: employmentType
  }]},
  FieldGroup #RatingGroup   : {Data: [{
    $Type : 'UI.DataFieldForAnnotation',
    Target: '@UI.DataPoint#Rating'
  }]}
});

annotate service.Employees with {
  fileContent @Core.MediaType                  : mimeType;
  fileName    @Core.ContentDisposition.Filename: fileName;
};

annotate service.Employees with @(Communication.Contact: {
  fn   : name,
  email: [{
    type   : #work,
    address: email
  }],
  tel  : [{
    type: #work,
    uri : phone
  }]
});



annotate service.Employees with {
  to_Skills @(UI.MultiValue: true)

}


annotate service.Employees with @(UI: {
  FieldGroup #General     : {Data: [
    {
      Label: 'Name',
      Value: name
      
    },
    {
      Label: 'Role',
      Value: role
    },
    {
      Label: 'Department',
      Value: department
    },
    {
      Label: 'Active',
      Value: isActive,
      ![@UI.PartOfPreview]: false
    },
    {
      Label: 'Joining Date',
      Value: joinDate,
      ![@UI.PartOfPreview]: false
    },
    {
      Label: 'Last Logged In',
      Value: lastLogin,
      ![@UI.PartOfPreview]: false
    },
    {
      Label: 'Skill',
      Value: to_Skills.name,
      ![@UI.PartOfPreview]: false
    },
    {
      Label: 'Height',
      Value: height,
      ![@UI.PartOfPreview]: false
    }
  ]},
  FieldGroup #Contact     : {Data: [{
    $Type : 'UI.DataFieldForAnnotation',
    Target: '@Communication.Contact',
    Label : 'Contact Details'
  }]

  },
  FieldGroup #Attachment  : {Data: [
    {Value: fileName},
    {Value: fileContent}
  ]},
  FieldGroup #Website     : {Data: [{
    $Type: 'UI.DataFieldWithUrl',
    Value: name,
    Url  : profileAddress
  }]},
  FieldGroup #Phone_Secret: {Data: [{
    Value: phone,
    Label: 'Phone Number'
  }]},
  FieldGroup #Description : {Data: [{
    Value: description,
    Label: 'Description'
  }]}
});

annotate service.Employees with @(UI: {Facets: [
  {
    $Type : 'UI.ReferenceFacet',
    Label : 'General Info',
    Target: '@UI.FieldGroup#General'
  },
  {
    $Type : 'UI.ReferenceFacet',
    Label : 'Contact Info',
    Target: '@UI.FieldGroup#Contact'

  },
  {
    $Type : 'UI.ReferenceFacet',
    Label : 'Attachments',
    Target: '@UI.FieldGroup#Attachment'
  },
  {

    $Type : 'UI.ReferenceFacet',
    Label : 'Links',
    Target: '@UI.FieldGroup#Website'

  },
  {
    $Type : 'UI.ReferenceFacet',
    Label : 'Masked Value',
    Target: '@UI.FieldGroup#Phone_Secret'
  },
  {
    $Type : 'UI.ReferenceFacet',
    Label : 'Description',
    Target: '@UI.FieldGroup#Description'

  }
]});

annotate service.Skills with {
  name @Common.ValueList: {
    CollectionPath: 'Skills',
    Parameters    : [{
      $Type            : 'Common.ValueListParameterInOut',
      LocalDataProperty: name,
      ValueListProperty: 'name'
    }]
  };
};


annotate service.Employees with {
  heightUnit @Common.ValueList: {
    CollectionPath: 'Units',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: heightUnit,
        ValueListProperty: 'code'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      }
    ]
  };
};


annotate service.Employees with {
  height @Measures.Unit: heightUnit;
};


annotate service.Employees with {
  employmentType @Common: {
    Label                   : 'Employment Type',
    Text                    : to_EmploymentType.name,
    TextArrangement         : #TextOnly,
    ValueListWithFixedValues: true,
    ValueList               : {
      Label         : 'Employment Type',
      CollectionPath: 'EmploymentTypes',
      Parameters    : [{
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: employmentType,
        ValueListProperty: 'code'
      }]
    }
  };
};



// annotate service.Employees with @UI.LineItem: [
//   {Value: name},
//   {Value: role},
//   {
//     Value      : status,
//     Criticality: criticality
//   },
//   {Value: isActive},
//   {
//     $Type         : 'UI.DataFieldForAnnotation',
//     Label         : 'Rating',
//     Target        : '@UI.DataPoint#Rating',
//     @UI.Importance: #High,
//   }
// ];
annotate service.Employees with @odata.draft.bypass;

// annotate service.Employees with @UI: {
//   SelectionMode: #Multi
// };

annotate service.Employees with @(
    UI.DataPoint #Rating : {
        Value : rating,
        TargetValue : 5,
        Visualization : #Rating,
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : role,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Criticality:criticality
        },
        {
            $Type : 'UI.DataField',
            Value : isActive,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Label : 'Rating',
            Target : '@UI.DataPoint#Rating',
            @UI.Importance : #High,
        },
    ]
);



//Quick variant selection


// annotate service.Employees with @UI.SelectionVariant #All: {
//   Text: 'All Employees'
// };

// annotate service.Employees with @UI.SelectionVariant #Active: {
//   Text: 'Active Employees',
//   SelectOptions: [{
//     PropertyName: isActive,
//     Ranges: [{
//       Sign: #I,
//       Option: #EQ,
//       Low: true
//     }]
//   }]
// };

// annotate service.Employees with @UI.SelectionVariant #Inactive: {
//   Text: 'Inactive Employees',
//   SelectOptions: [{
//     PropertyName: isActive,
//     Ranges: [{
//       Sign: #I,
//       Option: #EQ,
//       Low: false
//     }]
//   }]
// };

// annotate service.Employees with @UI.SelectionVariant #HighRating: {
//   Text: 'High Rating',
//   SelectOptions: [{
//     PropertyName: rating,
//     Ranges: [{
//       Sign: #I,
//       Option: #GE,
//       Low: 4
//     }]
//   }]
// };


// annotate service.Employees with @UI.SelectionPresentationVariant #All: {
//   SelectionVariant    : '@UI.SelectionVariant#All',
//   PresentationVariant : {
//     Visualizations: ['@UI.LineItem']
//   }
// };

// annotate service.Employees with @UI.SelectionPresentationVariant #Active: {
//   SelectionVariant    : '@UI.SelectionVariant#Active',
//   PresentationVariant : {
//     Visualizations: ['@UI.LineItem']
//   }
// };

// annotate service.Employees with @UI.SelectionPresentationVariant #Inactive: {
//   SelectionVariant    : '@UI.SelectionVariant#Inactive',
//   PresentationVariant : {
//     Visualizations: ['@UI.LineItem']
//   }
// };

// annotate service.Employees with @UI.SelectionPresentationVariant #HighRating: {
//   SelectionVariant    : '@UI.SelectionVariant#HighRating',
//   PresentationVariant : {
//     Visualizations: ['@UI.LineItem']
//   }
// };