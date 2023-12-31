# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


#Funcion para crear links aleatorios
def create_link(user)
    link_type = ['PrivateLink', 'TemporaryLink','StandardLink'].sample
    link_fields = {
        public_url: Faker::Internet.url,
        slug: Nanoid.generate(size: 5),
        type: link_type,
        user: user
      }
    
      if link_type == 'PrivateLink'
        link_fields[:password_digest] = BCrypt::Password.create(Faker::Internet.password)
      elsif link_type == 'TemporaryLink'
        link_fields[:expiration_date] = Faker::Time.forward(days: 30)
      end
    
      link = Link.create!(link_fields)
      create_visits(link)
      return link

end

def create_short_live_link(user)
  link_fields = {
    public_url: Faker::Internet.url,
    slug: Nanoid.generate(size: 5),
    type: 'ShortLiveLink',
    user: user,
    active: false,
    visited: 1,
  }
  link = Link.create!(link_fields)  
  Visit.create!(date: Faker::Date.between(from: 4.months.ago, to: Date.today), ip_address:Faker::Internet.public_ip_v4_address, user_agent: Faker::Internet.user_agent, link: link)
  return link
end

#Creacion de visitas aleatorias
def create_visits(link)
    (4.months.ago.to_date..Date.current).each do |date|
        rand(6).times do
            Visit.create!(date: date, ip_address:Faker::Internet.public_ip_v4_address, user_agent: Faker::Internet.user_agent, link: link)
        end
    end
end

#Creacion de datos
test_1 = User.create!(email: "test@test.com", name: "test", password: "123456", password_confirmation: "123456")

test_2 = User.create!(email: "test2@test.com", name: "test2", password: "123456", password_confirmation: "123456")

users = [test_1,test_2]

users.each do |user|
    20.times {create_link(user)}
    5.times {create_short_live_link(user)}
end
#create_visits