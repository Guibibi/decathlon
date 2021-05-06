## Getting started

To get started with the app, clone the repo and then do the following:

```
$ bundle install
```

Next, go into **config/initializers/geocoder.rb** and add the Google maps API key in **line 10**

Run the following commands:

```
$ rails db:migrate
$ rake import:tags
$ rake import:places
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```
