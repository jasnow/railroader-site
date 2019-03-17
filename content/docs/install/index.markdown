---
layout: page
title: "Installing Railroader"
date: 2011-08-26 23:18
comments: false
sharing: false
footer: true
---

### gem install

Railroader is best installed via [RubyGems](http://rubygems.org/):

    gem install railroader

This will provide the `railroader` executable.

### bundler

Railroader can be added to a Gemfile:

    gem "railroader"

It is recommended to _always_ use the latest version of Railroader.

### git clone

If you must have the latest and greatest, then you can build the gem yourself:

    git clone git://github.com/david-a-wheeler/railroader.git
    cd railroader
    gem build railroader.gemspec
    gem install railroader-*.gem

---
[Running Railroader](/docs/running)

[More documentation](/docs)
