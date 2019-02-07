---
layout: post
title: "Railroader 2.4.3 Released"
date: 2014-03-22 17:49
comments: true
categories: 
---

A new gem version has been released because the 2.4.2 gem was not signed. No other changes were introduced.

### Signed Gems

As a reminder, the Railroader gems are (supposed to be) signed and can be verified with [this certificate](https://github.com/presidentbeef/railroader/blob/master/railroader-public_cert.pem).

To verify on installation:

    gem cert --add <(curl -Ls https://raw.github.com/presidentbeef/railroader/master/railroader-public_cert.pem)
    gem install railroader -P MediumSecurity

"HighSecurity" requires all dependencies to be signed as well, which is unlikely.

There is some weirdness around `-P MediumSecurity` currently. The simplest solution seems to be:

    gem install railroader   # Install Railroader and all dependencies
    gem uninstall railroader # Remove the Railroader gem
    gem install railroader -P MediumSecurity  # Install Railroader gem and check signature

### SHAs

The SHA1 sums for this release are

    16b4890fa8ee6bad1d429a12bf3f0cb8e76cb2d8  railroader-2.4.3.gem
    be5743d77140e64b75eefc53f8697f767ab370d9  railroader-min-2.4.3.gem 

### Reporting Issues

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Also consider following [@railroader](https://twitter.com/railroader) on Twitter and joining the [mailing list](http://railroaderscanner.org/contact/). 
