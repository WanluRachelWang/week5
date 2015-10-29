# Week 5

This is an app that displays a simple flight arrivals board.  You can compare it to http://www.airport-ohare.com/arrivals.php.

Do the usual dance (`bundle install`, `rake db:setup`, etc.) to get going.

Together in class, we will try to accomplish the following:

1. Ajaxify the Delete buttons
1. Highlight delayed flights in pink
  1. Using ERB/CSS
  1. Using JS/CSS
1. Make the table swipe-able on small devices
1. Track visitors and page hits: statcounter.com, clicky.com,
1. Make the "Share" button send flight details to your phone
1. Deploy the app to Heroku.com

### CSS

Specificity rules are a little insane.  Use the Chrome Inspector and "Copy CSS Path" to help write CSS rules that will override Bootstrap defaults.

Raghu Betina (instructor at Booth) has a nice gist of resources: https://gist.github.com/rbetina/fa63df83d2f59fcab222


### Tracking

StatCounter.com works but not recommended for professional use.  Clicky.com is industrial-strength and easier to setup than Google Analytics, but *you must disable 3rd-party cookies in your browser if you want to see your own page hits from your own computer*.  Google Analytics is the best, but hard to understand because it's geared more for marketing departments and advertising campaigns.


### Deploying to Heroku

First, get a free account at Heroku.com and install the "Heroku toolbelt" as described here: https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up

Next, ensure that your application is under Git source control.  It does not need to be in Github.com (though it can be), but it does need to be contained in a local Git repository.  Use `git status` or the GitHub app to make sure that all of the files you want to deploy have been committed locally.

Now, you will need to make some changes to your Rails app, but fortunately the only file you need to change is your Gemfile.

DO NOT follow the instructions for this part that are posted at https://devcenter.heroku.com/articles/getting-started-with-rails4#write-your-app and tell your friends not to follow that part either (although the rest of that page is mostly fine).

INSTEAD, do the following:

1. Find the part of your Gemfile that says
```
 gem 'sqlite3'
```
 and change it so it's wrapped inside a `development, test` group:
```
  group :development, :test do
    gem 'sqlite3'
  end
```
2. Now, add a new `production` group and specify the following gems:
```
  group :production do
    gem 'pg'
    gem 'rails_12factor'
  end
```
3. Run a *special invocation* of bundle install, like this:

```
  $ bundle install --without-production
```

This updates your Gemfile.lock file, but it will not actually install the extra gems.

Next, commit your changes to your local Git repository.

FINALLY, you can deploy your application to the intertubes!  Just follow the instructions from this section (starting with "heroku create"): https://devcenter.heroku.com/articles/getting-started-with-rails4#deploy-your-application-to-heroku
