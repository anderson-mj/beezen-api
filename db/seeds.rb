# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

30.times do
    type = ["portal_opened", "portal_closed"].sample
    description = ["A portal was opened", "A portal was closed"].sample
    version = "version#{Random.rand(1..3)}.#{Random.rand(1..5)}.#{Random.rand(1..9)}"
    environment = ["production", "development"].sample
    tag = [version, environment]
    origin = "#{Random.rand(1..255)}.#{Random.rand(1..255)}.#{Random.rand(1..255)}.#{Random.rand(1..255)}"
    created_at = Time.now - Random.rand(1..1000000)
    updated_at = created_at + Random.rand(1..1000000)
    Alert.create(type: type, description: description, tag: tag, origin: origin, created_at: created_at, updated_at: updated_at)
end

# Admin user
User.create(email: "admin@beezenapi.com", password: "password12", password_confirmation: "password12")