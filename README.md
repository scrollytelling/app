[![Codeship Status for scrollytelling/app](https://codeship.com/projects/7f550840-f8e9-0132-4345-3a92bb520805/status?branch=master)](https://codeship.com/projects/86736)

[![Dependency Status](https://www.versioneye.com/user/projects/59afec9e0fb24f0032e40ad4/badge.svg?style=flat-square)](https://www.versioneye.com/user/projects/59afec9e0fb24f0032e40ad4)

## Getting started

This project is made in [Ruby on Rails](http://rubyonrails.org).

To get started, and install all needed software:

```
bin/setup
```

## Background jobs

If you need to add new media (photos, videos or audio) to your local install, the background jobs have to be running. They are listed in `Procfile` and the easiest way to run everything is using Foreman:

```
foreman start
```

To inspect the status of background jobs, visit `/background_jobs` with a web browser. You need to be authenticated to do so.

## Environment variables

A default set of credentials is installed during setup. Currently we use
environment variables for this, using [figaro](https://github.com/laserlemon/figaro). Real
credentials are not present in this file and must never be committed in code. To start using
external systems, you need to replace the placeholders with real secrets. Get
them from a friendly Scrollytelling representative.

Put those secrets in `config/application.yml` which is gitignored.

## Upload media

Stories can contain images, video and audio. We need a place to store it all, and S3 object storage was chosen for the task. Follow the Pageflow docs on how to create the buckets you will need.

Pageflow canon dictates that you should create separate buckets for each
environment. We don't subscribe to this idea. All assets are scoped by unique
path anyway, which works just fine. So, we need just two buckets:

```
media.scrollytelling.com # => initial uploads and hosting images
output.scrollytelling.com # => converted output, i.e. video and audio files
```

Buckets need public read access for everyone.

## Content Delivery

Set up a CDN of choice so that your uploads load zippy, have awesome cache expiration
and you're not hit by a surprise S3 transfer bill. Some suggested settings:

Cache-Control: expire in 12 months
If possible, enable gzip compression
Drop incoming cookie headers
Add CORS, allowing access from the hosts you use. (or `*`)
Add a robots.txt, disallowing access to everything

#### CORS

> Since Pageflow 12, [CORS headers are required on the output bucket](https://github.com/codevise/pageflow/blob/a8a53e57b8ca6003d9fc5f971bb878680264528b/doc/setting_up_external_services.md#bucket-configuration) because the MPEG-DASH player fetches
new video segments using Ajax all the time.

To debug assets, this command is your best friend:

``` shell
curl \
  -H "Origin: https://verhalen.volkskrant.nl/bla" \
  -H "Access-Control-Request-Method: GET" \
  -H "Access-Control-Request-Headers: X-Requested-With" \
  -X OPTIONS \
  --verbose \ https://output.scrollytelling.com/v1/main/pageflow/video_files/000/001/963/dash/medium/rendition-video-1.mp4
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
pageflow/themes/newtheme/logo.svg
pageflow/themes/newtheme/logo-black.svg
pageflow/themes/newtheme/favicon.ico
pageflow/themes/newtheme/preview.png
```

Place fonts in `app/assets/fonts/pageflow/themes/newtheme`. Only use `.woff` and `.woff2`. These formats are implemented in all browsers. Other formats are just pollution.

Register the theme name in `config/locales/themes.en.yml` and other language files, if applicable. This is needed for per-entry theme selection.

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
