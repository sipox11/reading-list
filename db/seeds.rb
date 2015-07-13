# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.destroy_all
Genre.destroy_all

fiction = Genre.create!(name: 'Fiction')
non_fiction = Genre.create!(name: 'Non-Fiction')
educational = Genre.create!(name: 'Educational')

Book.create!([{
  title: "The Da Vinci Code",
  author: "Dan Brown",
  description: "The Da Vinci Code is a 2003 mystery-detective novel by Dan Brown. It follows symbologist Robert Langdon and cryptologist Sophie Neveu after a murder in the Louvre Museum in Paris, when they become involved in a battle between the Priory of Sion and Opus Dei over the possibility of Jesus Christ having been married to Mary Magdalene. The title of the novel refers, among other things, to the finding of the first murder victim in the Grand Gallery of the Louvre, naked and posed like Leonardo da Vinci's famous drawing, the Vitruvian Man, with a cryptic message written beside his body and a pentagram drawn on his chest in his own blood.",
  amazon_id: "0307474275", 
  rating: 5, 
  finished_on: 5.years.ago, 
  genres: [fiction]
},
{
  title: "How to Win Friends & Influence People",
  author: "Dale Carnegie",
  description: "For more than sixty years the rock-solid, time-tested advice in this book has carried thousands of now famous people up the ladder of success in their business and personal lives. ",
  amazon_id: "0671027034", 
  rating: 4, 
  finished_on: 6.months.ago, 
  genres: [non_fiction, educational]
},
{
  title: "Mr. Mercedes",
  author: "Stephen King",
  description: "In the frigid pre-dawn hours, in a distressed Midwestern city, desperate unemployed folks are lined up for a spot at a job fair. Without warning, a lone driver plows through the crowd in a stolen Mercedes, running over the innocent, backing up, and charging again. Eight people are killed; fifteen are wounded. The killer escapes.",
  amazon_id: "1476754470", 
  rating: 2, 
  finished_on: nil, 
  genres: [fiction]
}])

p "Created #{Book.count} books"
p "Created #{Genre.count} genres"
