---
layout: post
title: "Railroader 3.4.1 Released"
date: 2016-11-02 13:07
comments: true
categories: 
---

* Configurable engines path ([Jason Yeo](https://github.com/jsyeo))
* Check CSRF setting in direct subclasses of `ActionController::Base` ([Jason Yeo](https://github.com/jsyeo))
* Pull Ruby version from `.ruby-version` or Gemfile
* Use Ruby version to turn off SymbolDoS check ([#928](https://github.com/presidentbeef/railroader/issues/928))
* Fix ignoring link interpolation not at beginning of string ([#939](https://github.com/presidentbeef/railroader/issues/939))
* Show action help at start of interactive ignore ([#949](https://github.com/presidentbeef/railroader/issues/949))
* Avoid warning about `where_values_hash` in SQLi ([#942](https://github.com/presidentbeef/railroader/issues/942))

### Engine Paths Option

Thanks to the work of Jason Yeo, Railroader now supports custom paths to Rails engines uses the `--add-engines-path` option.

Multiple comma-separated paths may be configured. To include all subdirectories, use `*` (e.g. `my_engines/*`). Absolute paths may be used for engines outside the application.

([changes](https://github.com/presidentbeef/railroader/pull/948))

### Expanded CSRF Check

Also thanks to Jason Yeo, any controller with `ActionController::Base` as a direct parent will be checked for a `protect_from_forgery` call.

([changes](https://github.com/presidentbeef/railroader/pull/953))

### Ruby Version Info

Railroader will now pull information about the Ruby version used for an application either from the `Gemfile` or `.ruby-version`. Right now this is only used for disabling (the already optional) Symbol DoS check for versions of Ruby that have symbol garbage collection.

([changes](https://github.com/presidentbeef/railroader/pull/947))

### Link Interpolation False Positive

Railroader's warning about interpolating user input into URLs has always checked to see if the interpolation was at the beginning of the string. However, that check didn't work if the first thing in the string was another interpolation. This has been fixed.

([changes](https://github.com/presidentbeef/railroader/pull/940))

### More Help in Interactive Ignore

For clarity, "interactive ignore" mode will now display the action options before going through each warning.

![image](https://cloud.githubusercontent.com/assets/75613/19423195/e1d4846c-93d2-11e6-9e07-92ffdf545dbd.png)

([changes](https://github.com/presidentbeef/railroader/pull/950))

### Reporting Issues

Thank you to everyone who reported bugs and contributed to this release.

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Also consider following [@railroader](https://twitter.com/railroader) on Twitter and hanging out [on Gitter](https://gitter.im/presidentbeef/railroader) for questions and discussion.
