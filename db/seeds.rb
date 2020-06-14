# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Gender.count.zero?
  ap 'สร้างข้อมูลเพศ ถ้าตารางเพศ มีค่าเท่ากับ 0'
  Gender.create([{ name: 'Men' }, { name: 'Women' }])
end

if Course.count.zero?
  ap 'สร้างข้อมูลวิชา ถ้าตารางวิชา มีค่าเท่ากับ 0'
  Course.create([
    { code: 'JAVA001', name: 'Java OOP' },
    { code: 'RUBY005', name: 'Ruby on Rails' },
    { code: 'JS0010', name: 'Javascript' }
  ])
end
