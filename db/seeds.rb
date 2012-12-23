# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Item.delete_all

u1 = User.create(:username => "admin", :first_name => "Admin", :email => "dustin@dcoates.com", :password => "ohHiThere", :password_confirmation => "ohHiThere")
u2 = User.create(:username => "charles", :first_name => "Charles", :last_name => "Smith", :email => "dustin@dcoates.com", :password => "ohHiThere", :password_confirmation => "ohHiThere")
u2 = User.create(:username => "lisa", :first_name => "Lisa", :email => "dustin@dcoates.com", :password => "ohHiThere", :password_confirmation => "ohHiThere")