# Railroader Site

This is the code for building <https://railroader.org>,
the Railroader website.

This is a project fork of the code for building the Brakeman website at:
<https://github.com/presidentbeef/brakeman-site>
It is legal, as the original website was licensed under the
Creative Commons Attribution 3.0 Unported License
(we are under the same license).

## Development

The site is built using (a very old version of) Octopress, which is a layer on top of Jekyll.

Changes to the site content should be made in `source/`. Markdown is preferred.

To build:

* Use Ruby 1.9.3.  If you use rbenv: rbenv install 1.9.3-p551
* To install a bundler that works on this old Ruby: gem install --version 1.17.3 bundler
* `bundle install` for dependencies
* To preview: `bundle exec rake preview` and visit http://localhost:4000



## License

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br />The text content of the site is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 Unported License</a>.
