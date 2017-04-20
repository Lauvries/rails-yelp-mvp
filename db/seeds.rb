puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
10.times do
  generated_restaurant = Restaurant.create(
    name:         Faker::RickAndMorty.character,
    address:      Faker::RickAndMorty.location,
    phone_number:  Faker::PhoneNumber.phone_number,
    category:        %w(chinese japanese belgian french italian).sample,
)
  3.times do
    generated_review = Review.new(
      content: Faker::RickAndMorty.quote,
      rating: (0..5).to_a.sample,
      )
    generated_review.restaurant = generated_restaurant
    generated_review.save
  end
end

puts 'Finished!'
