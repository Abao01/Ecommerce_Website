require "csv"

Game.delete_all
Publisher.delete_all
AdminUser.delete_all
GameGenre.delete_all
Genre.delete_all
Page.delete_all

filename = Rails.root.join("db/games.csv")
#puts "Loading Games from the csv file: #{filename}"
csv_data = File.read(filename)

games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |m|
  # puts m["genre"]
  publisher = Publisher.find_or_create_by(name: m["publisher"])
  # publisher = Publisher.create(name: m["publisher"])

  if publisher && publisher.valid?
    game = publisher.games.create(
      name: m["name"],
      description:  m["description"],
      price:        m["price"],
      role:         m["roles"],
      publisher_id:     publisher["id"]
    )
    genres = m["genre"].split(",").map(&:strip)
    genres.each do |genre|
      genre = Genre.create(name: genre)
    end

    query = URI.encode_www_form_component([game.name,publisher.name].join(","))
    downloaded_img = URI.open("https://source.unsplash.com/200x200/?#{query}")
    game.image.attach(io: downloaded_img, filename: "m-#{[game.name,publisher.name].join('-')}.jpg")
  end
end

Page.create(
  title:     "About the Data",
  content:   "The data sources powering this game website was provided by Nintendo.",
  permalink: "about"
)

Page.create(
  title:     "Contact Us",
  content:   "If you like this website and would like to reach out, please email me at 2519663066h@gmail.com",
  permalink: "contact"
)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
puts "Created #{Publisher.count} Publishers."
puts "Created #{Game.count} Games."
puts "Created #{Genre.count} Genres."
