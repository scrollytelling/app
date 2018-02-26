# Close Window for Pageflow

This gem renders a close button where usually the theme logo is rendered.

Why is this a thing? Well, maybe you have opened a window to a Scrollytelling
from a landing page, and you would like folks to simply close it to return to
that.

> You can't close a window you didn't open, dummy

I know, dummy! That's why when there is no opener, it will still show the
logo, but it will be a link this time, giving folks the opportunity to go to
the landing page from the Scrollytelling. And a good time was had by everyone.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pageflow-closewindow'
```

And then execute:

    $ bundle

## Usage

Add it to `config/initializers/pageflow.rb`:

``` ruby
Pageflow.configure do
  config.plugin(Pageflow::Closewindow.plugin)
end
```

And the asset pipeline:

```
// app/assets/stylesheets/application.scss
@import "pageflow/closewindow";

// app/assets/javascript/application.js
//= require pageflow/closewindow
```

Then bump your asset pipeline version, because the editor JavaScript has to be
recompiled for the new translations to show up.

```
# config/initializers/assets.rb
Rails.application.config.assets.version = '2' # change this value
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/scrollytelling/pageflow-closewindow. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pageflow::Closewindow project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pageflow-closewindow/blob/master/CODE_OF_CONDUCT.md).
