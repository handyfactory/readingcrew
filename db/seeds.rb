# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
file = File.read('test4.csv')
datas = CSV.parse(file, headers: true)

datas.each do |data|
    User.create(
        email: data[0],
        password: data[1],
        password_confirmation: data[2],
        image: data[3],
        name: data[4]
            
        )
end


User.create(
    email: "admin@admin.com",
    password: "12341234",
    password_confirmation: "12341234",
    name: "관리자",
    
    is_admin?: true
    )
