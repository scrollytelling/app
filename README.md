[![Codeship Status for scrollytelling/app](https://codeship.com/projects/7f550840-f8e9-0132-4345-3a92bb520805/status?branch=master)](https://codeship.com/projects/86736)

[![Dependency Status](https://www.versioneye.com/user/projects/59afec9e0fb24f0032e40ad4/badge.svg?style=flat-square)](https://www.versioneye.com/user/projects/59afec9e0fb24f0032e40ad4)

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

To inspect the queues, visit `/background_jobs` with a web browser. You need to be authenticated to do so.

## Environment variables

Make sure to create config/application.yml and set the ENV variables.


## CORS

Since Pageflow 12, [CORS headers are required on the output bucket](https://github.com/codevise/pageflow/blob/a8a53e57b8ca6003d9fc5f971bb878680264528b/doc/setting_up_external_services.md#bucket-configuration).

To enable them, go into your output bucket configuration and paste into CORS configuration:

``` xml
<CORSConfiguration xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
    <CORSRule>
        <AllowedOrigin>*</AllowedOrigin>
        <AllowedMethod>GET</AllowedMethod>
        <MaxAgeSeconds>28800</MaxAgeSeconds>
        <AllowedHeader>*</AllowedHeader>
    </CORSRule>
</CORSConfiguration>
```

To debug assets, this command is your best friend:

``` shell
curl \
  -H "Origin: https://verhalen.volkskrant.nl/bla" \
  -H "Access-Control-Request-Method: GET" \
  -H "Access-Control-Request-Headers: X-Requested-With" \
  -X OPTIONS \
  --verbose \ https://output.scrollytelling.io/v1/main/pageflow/video_files/000/001/963/dash/medium/rendition-video-1.mp4
```

This should return with `204 No Content`.

## Deploying a new theme

Register it:

```
# config/initializers/pageflow.rb
Pageflow.configure do
  config.themes.register(:newtheme)
end
```

In `app/assets/stylesheets/pageflow/themes`, copy `default.scss` to `newtheme.scss` and modify at will.

Images to be placed:

```
pageflow/themes/newtheme/logo.png
pageflow/themes/newtheme/logo_print.png
pageflow/themes/newtheme/favicon.ico
```

Place fonts in `app/assets/fonts/pageflow/themes/newtheme`. Only use `.woff` and `.woff2`. These formats are implemented in all browsers. Other formats are just pollution.

## Deploying new analytics

Add the new account to the list in `config/initializers/pageflow.rb`. This will register it for the account only.

Create a new directory in `app/views/widgets/analytics` and place two partials in it: one for the header and one for the body. Most files must be present, but can be empty.

### Generating Google Analytics tracking code

Use `isogram` to generate a customized tracking code!

```
npm install -g isogram
isogram scrolLy --id XXXXXXX-XX | pbcopy
```

will put this code in your clipboard:

```
!function(s,c,r,o,l,L,y){s.GoogleAnalyticsObject=r;s[r]||(s[r]=function(){
(s[r].q=s[r].q||[]).push(arguments)});s[r].l=+new Date;L=c.createElement(o);
y=c.getElementsByTagName(o)[0];L.src=l;y.parentNode.insertBefore(L,y)}
(window,document,'ga','script','//www.google-analytics.com/analytics.js');

ga('create', 'UA-XXXXXXX-XX', 'auto');
ga('send', 'pageview');
```

Replace `XXXXXXX-XX` with the ID given to you by the client. This code goes into the `body` partial. As you can see, it's far superior to the standard one from Google.

### Translations

Add the widget translations to `en.yml` and any other localization file you have active.

Change the asset version, because the widget names are cached in the front-end and this cache needs to expire.

### Deploy and enable

Then deploy the code and enable the widget in the corresponding account, and the code in the corresponding theming (edit account). After that, all new stories will have this widget enabled. For previous stories, you need to add the widget manually.

### Thank you!

# ![BrowserStack](public/img/BrowserStack.jpg)

Cross-platform quality assurance is graciously donated by @browserstack, thanks folks! ❤️

## Code of conduct

Please note that this project is released with a Contributor Code of Conduct. By participating in this project you agree to abide by its terms.
