[ ![Codeship Status for scrollytelling/app](https://codeship.com/projects/7f550840-f8e9-0132-4345-3a92bb520805/status?branch=master)](https://codeship.com/projects/86736)

## Getting started

You need Ruby, version is listed in `.ruby-version`. Use rbenv or RVM to install it.
You also need MySQL, Redis and ImageMagick. On a mac, use Homebrew to install them all.

After installing Ruby and doing `gem install bundler` you can switch to the project
root directory and install the required software, and set up the database.

```
bundle
bin/rake db:setup
```

Then start the server with `bin/rails s`.

## Background jobs

Remember you need to run background jobs to process uploads. See `Procfile`.

## Environment variables

Make sure to create config/application.yml and set the ENV variables.

## Deploying a new theme

Register it:

```
# config/initializers/pageflow.rb
Pageflow.configure do
  config.themes.register(:newtheme)
end
```

Copy the most recent theme's .scss file to `themename.scss` and modify at will.

Images to be placed:

```
pageflow/themes/#{$theme-name}/logo.png
pageflow/themes/#{$theme-name}/logo_print.png
pageflow/themes/#{$theme-name}/favicon.ico
```

Place fonts in `app/assets/fonts/pageflow/themes/#{$theme-name}`. Only use .woff - this format is implemented in all browsers.

## Deploying new analytics

Add the new account to the list in `config/initializers/pageflow.rb`. This will register it for the account only.

Create a new directory in `app/views/widgets/analytics` and place two partials in it: one for the header and one for the body. Most files must be present, but can be empty.

Add the widget translations to `en.yml` and any other localization file you have active.

Change the asset version, because the widget names are cached in the front-end and this cache needs to expire.

Then deploy the code and enable the widget in the corresponding account, and the code in the corresponding theming (edit account). After that, all new stories will have this widget enabled. For previous stories, you need to add the widget manually.

## Code of conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.
