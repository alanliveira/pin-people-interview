Modelagem das tabelas

employee
- [x] id
- [x] departament_id -> references to company_role
- [x] position_id -> references to company_role
- [x] function_id -> references to company_role
- [x] name
- [x] email
- [x] corporate_email
- [x] phone_number
- [x] company_tenure
- [X] location
- [X] gender
- [X] geration

question
- [ ] id
- [ ] company_id
- [ ] name
- [ ] type

answers
- [ ] id
- [ ] question_id
- [ ] value
- [ ] comment

surveys
- [ ] id
- [ ] employee_id
- [ ] question_ids