# Dallar

- master
- [10-user](https://github.com/19test/sti-demo/tree/10-user)

Burada STI'den konuşacağız fakat MTI'de var
<http://mediumexposure.com/multiple-table-inheritance-active-record/>

# STI (Single Table Inheritance)

Gerçeklemeye konu olan nesne yapısı/ilişkisi,

![employee](http://yuml.me/89799181.jpg)

Console,

    > FullTimeEmployee.create!(:name => "Jim", :salary => "10,000", :hours => "37")
    > TempEmployee.create!(:name => "John", :salary => "15,000", :duration => "5")
    > StudentEmployee.create!(:name => "Joe", :salary => "20,000",
        :university => "Queens University, Belfast")
    > y Employee.all
      Employee Load (0.2ms)  SELECT "employees".* FROM "employees"
    ---
    - !ruby/object:FullTimeEmployee
      attributes:
        id: 1
        name: Jim
        salary: '10,000'
        hours: '37'
        duration:
        university:
        type: FullTimeEmployee
        created_at: 2012-05-24 08:36:18.960678000 Z
        updated_at: 2012-05-24 08:36:18.960678000 Z
    - !ruby/object:TempEmployee
      attributes:
        id: 2
        name: John
        salary: '15,000'
        hours:
        duration: '5'
        university:
        type: TempEmployee
        created_at: 2012-05-24 08:37:22.752618000 Z
        updated_at: 2012-05-24 08:37:22.752618000 Z
    - !ruby/object:StudentEmployee
      attributes:
        id: 3
        name: Joe
        salary: '20,000'
        hours:
        duration:
        university: Queens University, Belfast
        type: StudentEmployee
        created_at: 2012-05-24 08:37:54.233763000 Z
        updated_at: 2012-05-24 08:37:54.233763000 Z
    => nil

# Extra

İki STI modeli arasında haberleşme kurulumu nasıl? Bunun gerçeklemesi ilgili
[commit](https://github.com/19/osce/commit/049206e001e58dd159d2c78ce7cebb5d2e00cde9) te yapıldı.

Elimizde `User` modeli var STI üzerinden `Editor` vd:
![user](http://yuml.me/72de1299.jpg)

Ayrıca `Question` modelinde STI üzerinden `Qumcq` vd:
![question](http://yuml.me/e8dc8adc.jpg)

Bunları model üzerinde şöyle bağladım,

        class Qumcq < Question
                has_and_belongs_to_many :editors, class_name: 'User',
                        join_table: 'users_questions',
                        association_foreign_key: 'user_id', foreign_key: 'question_id'
        end

        class Editor < User
                has_and_belongs_to_many :questions, class_name: 'Question',
                        join_table: 'users_questions',
                        association_foreign_key: 'question_id', foreign_key: 'user_id'
        end

Test,

        > Qumcq.last.editors
