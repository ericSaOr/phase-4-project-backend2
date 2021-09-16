# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Bakery.destroy_all




puts ':bakeling: Seeding baked goods...'
Bakery.create!([
  {
    item: 'Choco coco cookie',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGpOcfiVa3JU8mwNzcLD9zshQd8c91lg6xuw&usqp=CAU',
  },
  {
    item: 'So sweet',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS48dUlC8dM0A8b8lsl5QG9T_ed9-QrgC3x3A&usqp=CAU',
  },
  {
    item: 'Red Locks',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMtytJtOvxZXxp5UPg6-1gWNweWwVdyfwm1Q&usqp=CAU',
  },
  {
    item: 'Oogie Gooie',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeHXQy10Zw7-8N2sBG0FUE8h7uKu1tZBAcFDapzgQPGDT3xzZ1gdjLvKYGUb9a_mBAcI4&usqp=CAU',
  },
  {
    item: 'Pumpkin King',
    image: 'https://tmbidigitalassetsazure.blob.core.windows.net/rms3-prod/attachments/37/1200x1200/Gingerbread-Spiced-Pumpkin-Pie_EXPS_SDDJ19_123630_C07_18_5b.jpg'
  }])
puts ':white_check_mark: Done seeding!'

puts "🏕️ Seeding users..."

user1 = User.create(username: 'Caitlin', password: 'noot1')
user2 = User.create(username: 'Rose', password: 'noot3')
user3 = User.create(username: 'Kachaaa', password: 'noot4')

puts "✅ Done seeding!"

puts "Seeding reviews..."

# Signup.create(camper_id: camper1.id, activity_id: activity2.id, time: 11)

    review1 = Review.create(
        date_time: 2,
        note: "Not good",
        user_id: User.all.sample.id,
        bakery_id: Bakery.all.sample.id)
    

    review2 = Review.create(
        date_time: 6,
        note: "This baked good smells bad but I like it.",
        user_id: User.all.sample.id,
        bakery_id: Bakery.all.sample.id)

    review3 = Review.create(
        date_time: 3,
        note: "I hate this baked good, refund now.",
        user_id: User.all.sample.id,
        bakery_id: Bakery.all.sample.id
        )

puts "✅ Done seeding!"

