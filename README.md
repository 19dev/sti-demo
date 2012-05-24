# User + Role

İlgili nesne yapısı/ilişkisine dair çizim,

![user](http://yuml.me/3dff02a2.jpg)

Console,

    > Administrator.create(name: "admin")
    > Editor.create(name: "editor")
    > Author.create(name: "author")
    > 
    > y Administrator.first
    --- !ruby/object:Administrator
    attributes:
      id: 1
      name: admin
      type: Administrator
      created_at: 2012-05-24 13:16:14.604016000 Z
      updated_at: 2012-05-24 13:16:14.604016000 Z
    => nil
    > y Editor.first
    --- !ruby/object:Editor
    attributes:
        id: 2
        name: editor
        type: Editor
        created_at: 2012-05-24 13:17:41.151248000 Z
        updated_at: 2012-05-24 13:17:41.151248000 Z
    => nil
    >
    > y User.all
    ---
    - !ruby/object:Administrator
      attributes:
        id: 1
        name: admin
        type: Administrator
        created_at: 2012-05-24 13:16:14.604016000 Z
        updated_at: 2012-05-24 13:16:14.604016000 Z
    - !ruby/object:Editor
      attributes:
        id: 2
        name: editor
        type: Editor
        created_at: 2012-05-24 13:17:41.151248000 Z
        updated_at: 2012-05-24 13:17:41.151248000 Z
    => nil
    >
    > Role.create(name: "Kullanıcı Yönetimi")   #=> role_id: 1
    > Role.create(name: "Soru İşlemleri")       #=> role_id: 2
    > Role.create(name: "Cari İşlemler")        #=> role_id: 3
    > Role.create(name: "İçerik Yönetimi")      #=> role_id: 4
    >
    > Administrator.first.role_ids = [1,3]      #=> role_id: 1 ve 3 olan rolleri ver
    > Administrator.first.roles
    [#<Role id: 1, name: "Kullanıcı Yönetimi"...>, #<Role id: 3, name: "Cari İşlemler",...>]
    >
    > Editor.last.roles.create(name: "roleX")
    > Editor.last.role_ids
    [5]
    > User.last.role_ids    #=> Editor.last
    [5]

## Kritik Bilgi

- User'ın altında yer alan her bir alt model için join table (ör.
  `administrators_roles` tablosu) yerine tek bir join tablo (`users_roles`)
  kullanılıyor

- bunu başarmak için ise, her bir alt modelde ör. Administrator

    class Administrator < User
        has_and_belongs_to_many :roles, :join_table => 'users_roles', 
            :foreign_key => 'user_id'
    end

- bundan sonrasında ise

    > Editor.last.roles
    > Editor.last.roles.create(name: "foo")
    > Editor.last.role_ids = [1, 3]

# Kaynaklar

- http://stackoverflow.com/questions/4381154/rails-migration-for-has-and-belongs-to-many-join-table
