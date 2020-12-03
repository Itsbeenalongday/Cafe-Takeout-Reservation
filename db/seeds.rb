# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SIMAGE = ["아메리카노", "아이스 아메리카노", "카페 모카","아이스 카페 모카" , "카페 라떼", "아이스 카페 라떼", "카푸치노", "아이스 카푸치노", "카라멜 마키아또","아이스 카라멜 마키아또","아포가토", "에스프레소", "흑당 프라푸치노","카라멜 프라푸치노", "자바 칩 프라푸치노", "콜드 브루"]
IMAGEPATH = "/public/images/"

Arr =[3000,3500,4000,4500,5000]

def destroy_all_product_description
  ProductDescription.destroy_all
  puts "ProductDescription 삭제"
end
def destroy_all_AdminUser
  AdminUser.destroy_all
  puts "AdminUser 삭제"
end

def generate_product_description
  
    SIMAGE.each do |pd|
      imagePath = File.open("#{Rails.root}"+ IMAGEPATH + pd +".jpg")
      ProductDescription.create(name: pd, price: Arr.shuffle.first, description: pd + "입니다.", avg_producingtime: 5, image: imagePath)
      puts "음료 생성"
    end
end

def generate_User

end

destroy_all_AdminUser
destroy_all_product_description
generate_product_description

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?