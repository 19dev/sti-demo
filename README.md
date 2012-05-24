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
    > Role.create(name: "Kullanıcı Yönetimi")
    > Role.create(name: "Soru İşlemleri")
    > Role.create(name: "Cari İşlemler")
    > Role.create(name: "İçerik Yönetimi")
    >
    > Administrator.first.role_ids = [1,3]
    > Administrator.first.roles
    [#<Role id: 1, name: "Kullanıcı Yönetimi"...>, #<Role id: 3, name: "Cari İşlemler",...>]

# Kaynaklar

- http://stackoverflow.com/questions/4381154/rails-migration-for-has-and-belongs-to-many-join-table
