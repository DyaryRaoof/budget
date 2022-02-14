# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create!(name:'Dyary Raoof', email:'dyary2020@gmail.com', password:'123456', password_confirmation:'123456');
user2 = User.create!(name:'Mustafa Abbas', email:'mustafa@gmail.com', password:'123456', password_confirmation:'123456');

group1 = Group.create!(name:'Group 1', icon: 'https://www.shareicon.net/data/128x128/2017/07/13/888371_aim_512x512.png');
group2 = Group.create!(name:'Group 2', icon: 'https://www.shareicon.net/man-business-work-officer-businessman-888372');
group3 = Group.create!(name:'Group 3', icon: 'https://www.shareicon.net/data/128x128/2017/07/13/888383_time_512x512.png');

group4 = Group.create!(name:'Group 4', icon: 'https://www.shareicon.net/data/128x128/2017/07/13/888371_aim_512x512.png');
group5 = Group.create!(name:'Group 5', icon: 'https://www.shareicon.net/man-business-work-officer-businessman-888372');
group6 = Group.create!(name:'Group 6', icon: 'https://www.shareicon.net/data/128x128/2017/07/13/888383_time_512x512.png');
group7 = Group.create!(name:'Group 7', icon: 'https://www.shareicon.net/data/128x128/2017/07/13/888381_globe_512x512.png');


spending1 = Spending.create!(name:'Food', amount: 11, author: user1);;
spending2 = Spending.create!(name:'Clothing', amount: 44, author: user1);;
spending3 = Spending.create!(name:'House Tools', amount: 33, author: user1);;

spending4 = Spending.create!(name:'Food', amount: 1, author: user2);
spending5 = Spending.create!(name:'Car Repairs', amount: 22, author: user2);;
spending6 = Spending.create!(name:'House Tools', amount: 100, author: user2);;

GroupSpending.create!(group_id: group1.id, spending_id: spending1.id);
GroupSpending.create!(group_id: group1.id, spending_id: spending2.id);

GroupSpending.create!(group_id: group4.id, spending_id: spending4.id);
GroupSpending.create!(group_id: group4.id, spending_id: spending5.id);
GroupSpending.create!(group_id: group5.id, spending_id: spending6.id);




