[ ![Codeship Status for scrollytelling/app](https://codeship.com/projects/7f550840-f8e9-0132-4345-3a92bb520805/status?branch=master)](https://codeship.com/projects/86736)

## Getting started

```
bin/rake db:setup
```

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

Copy one of the existing theme's main CSS file, css folder and images folder.

Images to be replaced:

```
pageflow/themes/#{$theme-name}/loading.png
pageflow/themes/#{$theme-name}/logo_header.png (100 - 221 px wide)
pageflow/themes/#{$theme-name}/logo_header_invert.png (100 - 221 px wide)
pageflow/themes/#{$theme-name}/favicon.ico
```

Place fonts in `app/assets/fonts/pageflow/themes/#{$theme-name}`. Only use .woff - this format is implemented in all browsers.

Lastly change the colors in `variables.css.scss` into the colors used in the theme.

## Deploying new analytics

Go into `app/models/widgets/analytics.rb` and add a new static factory method.

Copy one of the existing analytics folders: `cp -r app/views/widgets/analytics/volkskrant app/views/widgets/analytics/NAME`.

Change the contents of both files, head and body. They must both remain present. Use HTML comments if you don't have a script to render here.

Then, register the new widget in `config/initializers/pageflow.rb`. Wrap it in a feature block.

Add the widget translations to `en.yml` and any other localization file you have active.

Then deploy the code and enable the widget in the corresponding account, and the code in the corresponding theming (edit account). After that, all new stories will have this widget enabled. For previous stories, you need to add the widget manually.

## Code of conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.
