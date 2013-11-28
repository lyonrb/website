# Lyon.rb website

This repository holds the Middleman source code for [Lyon.rb website](http://lyonrb.fr).

To create a new blog post: `middleman article "My Post title"`

## Usage

1. Clone this repository: `git clone git@github.com:lyonrb/website.git lyonrb-website`
2. Install requirements: `bundle install`
3. Run server for development: `middleman server`
4. Build static website: `middleman build`
5. Deploy !: `middleman deploy`

### GitHub API authentification

If you're experiencing API request rate limitation (which will cause `middleman build` or even `middleman server` to fail), you might want to have a valid OAuth token in your `GITHUB_API_KEY_FOR_LYONRB_WEBSITE` environment variable.

For instance, add this to your `~/.bashrc` file:
```shell
export GITHUB_API_KEY_FOR_LYONRB_WEBSITE=your_api_token_provided_by_github
```

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