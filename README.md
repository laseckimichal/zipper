## ZIPPER API

### Requirements:
  - Ruby: 3.2.0
  - Rails: 7.0.4
  - mysql

### Start project
---

#### 1. Check out the repository

```sh
$ git clone git@github.com:laseckimichal/zipper.git
```

#### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```sh
$ cp config/database.yml.sample config/database.yml
```

#### 3. Install gems

In project directory:
```sh
$ bundle install
```

#### 4. Create and setup the database

Run the following commands to create and setup the database.

```ruby
$ bundle exec rails db:prepare
```

#### 5. Create master.key

Create master.key file and contact repository owner for key value.

#### 6. Run server

You can start the rails server using the command given below.

```sh
$ rails s -p 3000
```
And now you can visit the site with the URL http://localhost:3000

### Optional
---

#### 1. Run tests

In project directory:
```sh
$ rspec       # Run the RSpec tests
$ rubocop     # Perform static code analysis using RuboCop
$ rubycritic  # Generate a detailed code quality report with RubyCritic
```

#### 2. Documentation

In project directory:
```sh
$ rails s -p 3000
```
And now you can visit the site with the URL http://localhost:3000/api/docs
