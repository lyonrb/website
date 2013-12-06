# Lyon.rb website

This repository holds the Middleman source code for [Lyon.rb website](http://lyonrb.fr).

To create a new blog post: `middleman article "My Post title"`

## Usage

1. Clone this repository: `git clone git@github.com:lyonrb/website.git lyonrb-website`
2. Install Ruby requirements: `bundle install`
3. Install Javascript requirements: `bower install`
3. Run server for development: `middleman server`
4. Build static website: `middleman build`
5. Deploy !: `middleman deploy`

### GitHub API authentification

If you're experiencing API request rate limitation (which will cause `middleman build` or even `middleman server` to fail), you might want to have a valid OAuth token in your `GITHUB_ACCESS_TOKEN` environment variable.

For instance, because this project uses [DotEnv](https://github.com/bkeepers/dotenv), add this to your `.env` file (in the project root directory):
```shell
GITHUB_ACCESS_TOKEN=your_api_token_provided_by_github
```

### Data

Data about members, meetups & conferences and companies is stored as YAML files. Available attributes are :

* `name`: regular human-readable name
* `website`: URL
* `logo`: image URL
* `email`: email address
* `github`: username only
* `twitter`: username only
* `meetup`: username only
* `vimeo`: username only
* `youtube`: username only
* `confreaks`: event slug
* `mailinglist`: URL
* `tags`: array of strings

Logos/avatars are fetched automatically from [Gravatar](https://gravatar.com) or [GitHub API](http://developer.github.com/v3).
GitHub projects are fetched automatically via [GitHub API](http://developer.github.com/v3).

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## Credits

* Michael Baudino (@michaelbaudino)
* Laurie Guetat (@laurieguetat)
* Camille Appert (@bibinou)

## License

See LICENSE.md file.