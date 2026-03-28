// namespace my.bookshop;
// using { cuid, managed } from '@sap/cds/common';

// entity PO : cuid, managed {
//   Price    : Integer; 
//   Product  : String;
//   Quantity : Integer;
// }


namespace my.app;

// type HeightUnit : String enum {
//   CM   = 'CM';
//   FEET = 'FT';
// };

entity Employee {
  key ID                : UUID;
      name              : String;
      role              : String;
      email             : String;
      phone             : String @Common: {Masked: true};
      imageUrl          : String; // for avatar
      status            : String;
      criticality       : Integer;
      isActive          : Boolean;
      progress          : Integer;
      joinDate          : Date;
      lastLogin         : Timestamp;
      fileName          : String;
      mimeType          : String;
      fileContent       : LargeBinary;
      department        : String;
      profileAddress    : String;
      to_Skills         : Composition of many Skill
                            on to_Skills.employee = $self;

      @UI.MultiLineText
      description       : String(1024);
      height            : Decimal(5, 2);
      heightUnit        : String;
      employmentType    : String(1) default 'F';
      to_EmploymentType : Association to EmploymentType
                            on to_EmploymentType.code = employmentType;
      rating : Integer;
}

entity Department {
  key ID   : UUID;
      name : String;
}

entity Skill {
  key ID       : UUID;
      name     : String;
      employee : Association to Employee;
}

entity Unit {
  key code : String;
      name : String;
}

entity EmploymentType {
  key code : String(1);
      name : String;
}
