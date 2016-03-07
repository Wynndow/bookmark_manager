## Bookmark Manager

#### About

The week 4 project at Makers Academy was to create a bookmark manager. The purpose was to teach us about relational databases, specifically PostgreSQL. The app was written in Ruby and uses the Sinatra framework. Datamapper is employed as an ORM for PostgreSQL. The project is test driven using RSpec and Capybara.

#### Installation

0. Clone this repo `$ git clone git@github.com:Wynndow/bookmark_manager.git`
0. Change directory into it `$ cd bookmark_manager`
0. Install dependencies with `$ bundle`
0. Create a database called `bookmark_manager_development` with PostgreSQL
0. Migrate the database with `$ rake db:auto_migrate`

#### Usage

0. Start the server with `$ rackup`
0. In your browser navigate to `$ http://localhost:9292/users/new`
0. Sign up.
0. Navigate to `$ http://localhost:9292/links/new` to submit new links.
0. To view a list of links filtered by tag navigate to `$ http://localhost:9292/tags/YOURTAG` where `YOURTAG` is the tag you would like to filter by.

#### Running tests

0. Create a database called `bookmark_manager_test` with PostgreSQL
0. Migrate the database with `$ rake db:auto_upgrade` (this will prevent data loss, unlike `auto_migrate`)
0. Run tests with `$ rspec`

#### Future improvements
- Add naviagtion buttons to prevent the need to navigate via URL.
- Improve the front end design to be more appealing.

### Original Instruction

As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of links on the homepage

As a time-pressed user
So that I can quickly find web sites I recently bookmarked
I would like to see links in descending chronological order

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to my bookmark manager

As a time-pressed user
So that I can organise my many links into different categories for ease of search
I would like to add tags to the links in my bookmark manager
As a time-pressed user

So that I can quickly find links on a particular topic
I would like to filter links by tag
