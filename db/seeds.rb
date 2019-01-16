# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cleaning DB
puts '---- Cleaning database... ----'
Request.destroy_all
puts '---- Database empty ----'

# Request seed
puts '---- Generating requests... ----'

sheldon = Request.new(
  name: "Sheldon Cooper",
  email: "theoneandonly@sheldoncooper.com",
  phone: "0123456789",
  bio: "Well, come on, you know who I am! I am in Paris for a few months and I want to work in your coworking, have heard it is the best. I am sure I'll find THE spot, MY spot! Oh, and I am brigging friends!",
  status: "accepted",
  confirm_token: "",
  email_confirmed: true)
sheldon.save

amy = Request.new(
  name: "Amy Farrah Fowler",
  email: "thewifey@sheldoncooper.com",
  phone: "0234567891",
  bio: "Hi there, I am Amy, Sheldon's wife! I will follow him wherever he goes, so here I am! So happy to be able to work in Paris, I hope I can have a spot in your coworking space soon so I can work on my neurobiology projects.",
  status: "accepted",
  confirm_token: "",
  email_confirmed: true)
amy.save

leonard = Request.new(
  name: "Leonard Hofstadter",
  email: "luckyman@shesaidyesicantbelieveit.com",
  phone: "0345678912",
  bio: "Hello, Leonard here! I am the best friend! With Penny, my wife, we decided to tag along when Sheldon asked us to go to France for a few months.",
  status: "confirmed",
  confirm_token: "",
  email_confirmed: true)
leonard.save

penny = Request.new(
  name: "Penny",
  email: "penny@pennytheactress.com",
  phone: "0456789123",
  bio: "Hi there, I am Penny, the neighbourgh! I am so happy to come to Paris, I am going to go shopping so many times! Oh, and so days, I will be coming to the cowork, obviously to do my job... need to pay the shopping bills!",
  status: "confirmed",
  confirm_token: "",
  email_confirmed: true)
penny.save

bernadette = Request.new(
  name: "Bernadette Maryann Rostenkowski",
  email: "bernadette@iamthebosshere.com",
  phone: "0567891234",
  bio: "Hi there, I am Bernadette, Howard's wife! Thrilled to come to Paris too, I'm sure I'm gonna love working from your cowork - and going shopping w/ Penny and Amy from time to time!",
  status: "unconfirmed",
  confirm_token: "",
  email_confirmed: false)
bernadette.save

howard = Request.new(
  name: "Howard Wolowitz",
  email: "mywifeistheboss@iamthebosshere.com",
  phone: "0678912345",
  bio: "Hey guys! I'm Howard! I'm an astronaut, went to space, yup! And I'm a magician too! Coming here w/ the gang and my wife Bernie. Did I mentioned I am an astronaut?",
  status: "unconfirmed",
  confirm_token: "",
  email_confirmed: false)
howard.save

raj = Request.new(
  name: "Rajesh Koothrappali",
  email: "hey@canttalktowomen.com",
  phone: "0789123456",
  bio: "Hello! Raj speaking here! I follow the group, hope there is still some space left in the cowork! Would love to work in Paris and discover the city of lights! Even if I'm more into stars and Planetarium!",
  status: "expired",
  confirm_token: "",
  email_confirmed: false)
raj.save

puts "---- Done! ----"
