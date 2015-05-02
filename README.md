lost_and_found
=======

matching finders and losers

Standard setup
--------------

1.  In Terminal, go to your projects directory and clone the project:

        git clone git@github.com:margOnline/lost_and_found.git

2.  Install gem dependencies:

        bundle install

3.  Create and set up the databases:

        rake db:create:all
        rake db:migrate db:test:prepare

4.  Copy the following example files to their real locations, and edit their
    settings as needed.

      `env.example` -> `.env`


5.  Run tests to make sure they pass with your environment:

        rspec spec

6.  Run the app! Boot your web server of choice. Options include:

    * Foreman:

            foreman start

    * Unicorn:

            unicorn -p 3000

    * The Rails default: `rails server`