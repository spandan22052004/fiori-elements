using { my.app as db } from '../db/schema';

service CatalogService {
   @odata.draft.enabled
  entity Employees as projection on db.Employee;
  entity Departments as projection on db.Department;
  entity Skills as projection on db.Skill;
  entity Units as projection on db.Unit;
  entity EmploymentTypes as projection on db.EmploymentType;
  // entity EmployeeSkills as projection on db.EmployeeSkill;
}