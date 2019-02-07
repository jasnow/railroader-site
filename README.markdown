# Railroader Site

This is the code for building <https://railroader.org>,
the Railroader website.

This is a project fork of the code for building the Brakeman website at:
<https://github.com/presidentbeef/brakeman-site>
It is legal, as the original website was licensed under the
Creative Commons Attribution 3.0 Unported License
(we are under the same license).

## Install instructions to make changes

This version of the site is generated using hugo. On Ubuntu use
~~~~
snap install hugo
~~~~

The older site is built using (a very old version of) Octopress, which is a layer on top of Jekyll.  We are seriously considering switching to Hugo, but the goal was to just get started.  First you need to install things so that you can make changes.

Changes to the site content should be made in `source/`. Markdown is preferred.

To install:

* Use Ruby 1.9.3.  If you use rbenv: rbenv install 1.9.3-p551
* To install a bundler that works on this old Ruby: gem install --version 1.17.3 bundler
* `bundle install` for dependencies

You also need to set up the "\_deploy" subdirectory so that it is a
clone from https://github.com/david-a-wheeler/railroader using its
gh-pages branch:

~~~~
  git clone https://github.com/david-a-wheeler/railroader.git
  mv railroader '_deploy'
  cd _deploy
  git checkout gh-pages
~~~~

## Making changes to the site

Edit pages within /source
(except for `source/railroader/docs/warning_types`).

Before generating a site, you should first copy the
relevant files from the main railroader site (master branch)
into `source/railroader/docs/warning_types`

~~~~
    bundle exec rake copy_docs_from_railroader
~~~~

To preview: `bundle exec rake preview` and visit http://localhost:4000

To deploy, generate the pages (to /public),
then run `bundle exec rake deploy` -
this will copy the files in /public and the dotfiles
to \_deploy, then push to the GitHub Pages (gh-pages) branch.

## License

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br />The text content of the site is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 Unported License</a>.
