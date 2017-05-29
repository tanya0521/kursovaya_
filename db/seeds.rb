if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

Hall.destroy_all; Exhibit.destroy_all; Collection.destroy_all
n = 20
for i in 0 ... n do
  Collection.create(c_name: "c_name" + i.to_s, description: "description" + i.to_s,
    date_begin: Date.today, date_end: Date.today)
end
for i in 0 ... n do
  h = Hall.new(name: "name" + i.to_s)
  h.collection = Collection.all[(0...n).to_a.shuffle[(rand * n).to_i]]
  e = Exhibit.new(e_name: "e_name" + i.to_s, description_e: "description_e" + i.to_s,
    i_value: i, age: i, size: "size" + i.to_s, condition: "condition" + i.to_s)
  e.collection = Collection.all[(0...n).to_a.shuffle[(rand * n).to_i]]
  h.save; e.save
end
