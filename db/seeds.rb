# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
crockford = Author.create(name: 'Douglas Crockford')
oreilly = Publisher.create(name: "O'Reilly")
goodparts = Book.create(title: 'JavaScript: The Good Parts',
  isbn: '9780596517748',
  cover: 'http://ecx.images-amazon.com/images/I/518QVtPWA7L._SX379_BO1,204,203,200_.jpg',
  publisher: oreilly)
goodparts.authors << crockford

white = Author.create(name: 'Matthew White')
pragprog = Publisher.create(name: 'Pragmatic Programmers')
ember2 = Book.create(title: 'Deliver Audacious Web Apps with Ember 2',
  isbn: ' 9781680500783',
  cover: 'http://ecx.images-amazon.com/images/I/51RVEzfr-LL._SX415_BO1,204,203,200_.jpg',
  publisher: pragprog)
ember2.authors << white

ruby = Author.create(name: 'Sam Ruby');
thomas = Author.create(name: 'Dave Thomas')
dhh = Author.create(name: 'David Heinemeier Hansson')
rails4 = Book.create(
    title: 'Agile Web Development with Rails 4 (Facets of Ruby)',
    isbn: '9781937785567',
    cover: 'http://ecx.images-amazon.com/images/I/51ETr-3MB1L._SX396_BO1,204,203,200_.jpg',
    publisher: pragprog)
rails4.authors << ruby
rails4.authors << thomas
rails4.authors << dhh
