require 'pry'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

datafile = Rails.root + 'db/words.csv'

CSV.foreach(datafile, headers: true, header_converters: :symbol) do |row|
  Word.create!({
    date: row[0],
    word: row[1],
    speech_type: row[2],
    definition: row[3],
    sentence: row[4]
  })
end
