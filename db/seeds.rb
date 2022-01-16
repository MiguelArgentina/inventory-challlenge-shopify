# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database"
Item.all.each do |item|
  print "."
  item.destroy
end
puts ""

puts "Creating inventory"
5.times do |index|
  print "."
  item = Item.create(
    name: "Test item #{index}",
    internal_code: "internal_code#{index}"
  )
  item.image.attach(io: File.open(File.join(Rails.root,"app/assets/images/item_#{index + 1}.jpg")), filename: "item_#{index + 1}.jpg")
  item.stock_entries.create(quantity:  rand(1..9) * 10)
end
puts ""