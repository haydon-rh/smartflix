require 'faker'

class CreateMovieWorker
  include Sidekiq::Worker
  sidekiq_options retry: false, queue: 'movies'

  def perform(*args)
    movie = Movie.create(title:Faker::Movie.title)
    puts "movie created"
  end
end
