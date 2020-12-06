# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SIMAGE = ["아메리카노2", "아이스 아메리카노", "카페 모카","아이스 카페 모카" , "카페 라떼", "아이스 카페 라떼", "카푸치노", "아이스 카푸치노", "카라멜 마키아또","아이스 카라멜 마키아또","아포가토", "에스프레소", "흑당 프라푸치노","카라멜 프라푸치노", "자바 칩 프라푸치노", "콜드 브루"]
IMAGEPATH = "/public/images/"

Arr =[3000,3500,4000,4500,5000]


def destroy_all_product_description
  ProductSalesVolume.destroy_all
  OrderLineItem.destroy_all
  ProductDescription.destroy_all
  puts "ProductDescription 삭제"
end

def destroy_all_AdminUser
  AdminUser.destroy_all
  puts "AdminUser 삭제"
end

def destroy_all_User
  User.destroy_all
  puts "User 삭제"
end

def destroy_all_order
  Order.destroy_all
  puts "Order 객체 삭제"
end

def get_user
  User.order("RANDOM()").first
end

def generate_product_description
  
    SIMAGE.each do |pd|
      imagePath = File.open("#{Rails.root}"+ IMAGEPATH + pd +".jpg")
      productnew = ProductDescription.create(name: pd, price: Arr.shuffle.first, description: pd + "입니다.", avg_producingtime: 5, image: imagePath)
      ProductSalesVolume.create(volume: Random.rand(100..300), product_description_id: productnew.id)
      puts "음료 생성"
    end
end

def generate_User
  10.times do 
    User.create(name: Faker::Name.name, phone: "010"+ Random.rand(1000..9999).to_s + Random.rand(1000..9999).to_s, password: "password", email: Faker::Internet.email)
    puts "User 생성"
  end
end

def generate_order
  10.times do
    #get_user.Order.create(order_at: Date.today, total_price: )
  end
end

destroy_all_product_description
destroy_all_AdminUser
generate_product_description
generate_User

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?