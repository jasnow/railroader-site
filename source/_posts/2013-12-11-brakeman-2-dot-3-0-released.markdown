---
layout: post
title: "Railroader 2.3.0 Released"
date: 2013-12-11 12:20
comments: true
categories: 
---

This is a small release, but adds several new warning codes for the latest Rails CVEs and a new check for uses of `permit!`. Also, this is the first signed gem release of Railroader; see below for details.

_Changes since 2.2.0:_

 * Add check for CVE-2013-4491 (i18n XSS)
 * Add check for CVE-2013-6414 (header DoS)
 * Add check for CVE-2013-6415 (`number_to_currency`)
 * Add check for CVE-2013-6416 (`simple_format` XSS)
 * Add check for CVE-2013-6417 (query generation)
 * Add check for `Parameters#permit!` ([#281](https://github.com/presidentbeef/railroader/issues/281))
 * Fix Slim XSS false positives ([Noah Davis](https://github.com/noahd1))
 * Whitelist `Model#create` for redirects ([#406](https://github.com/presidentbeef/railroader/issues/406))
 * Collapse send/try calls
 * Fix scoping issues with instance variables and blocks ([#406](https://github.com/presidentbeef/railroader/issues/406))
 * Fix typos in reflection and translate bug messages

### I18n XSS

[CVE-2013-4491](https://groups.google.com/d/msg/ruby-security-ann/pLrh6DUw998/2i61N5c3heUJ) is a possible XSS in the i18n gem. Railroader will warn unless the i18n gem is updated to the proper version or the workaround is used.

### Header DoS

[CVE-2013-6414](https://groups.google.com/d/msg/ruby-security-ann/A-ebV4WxzKg/KNPTbX8XAQUJ) is a possible denial of service from special headers. Railroader will warn unless the workaround is used.

### Currency XSS

[CVE-2013-6415](https://groups.google.com/d/msg/ruby-security-ann/9WiRn2nhfq0/2K2KRB4LwCMJ) is an XSS in the second argument of `number_to_currency`. Railroader will warn on uses of `number_to_currency` with dangerous unescaped arguments. If no dangerous uses are found, Railroader will provide a general warning about the CVE.

### Simple Format XSS

[CVE-2013-6416](https://groups.google.com/d/msg/ruby-security-ann/5ZI1-H5OoIM/ZNq4FoR2GnIJ) is an XSS in `simple_format`, which does not escape its output. Railroader will warn on dangerous uses of `simple_format`. If no uses are found, it will report a general warning.

### Query Generation Vulnerability

[CVE-2013-6417](https://groups.google.com/d/msg/ruby-security-ann/niK4drpSHT4/g8JW8ZsayRkJ) is the continuation of an old problem with SQL queries. The newest issue is caused by Rack middleware freezing the parameters before they can be cleaned up. Railroader reports a general warning about this.

### Check for Permit!

Railroader now warns on uses of `Parameters#permit!`, which bypasses mass assignment protections. If a `permit!` is used without a subsequent mass assignment in the same method, the confidence will be medium.

([changes](https://github.com/presidentbeef/railroader/pull/414))

### Slim XSS False Positives

([Noah Davis](https://github.com/noahd1)) provided a fix for XSS false positives in Slim templates when ActiveSupport is loaded. While Railroader itself does not depend on ActiveSupport, it might be loaded if Railroader is run with Bundler or as part of a Rake task.

([changes](https://github.com/presidentbeef/railroader/pull/410))

### Whitelist Record Creation in Redirects

Redirects to `Model#create` and `Model#create!` should no longer warn.

([changes](https://github.com/presidentbeef/railroader/pull/408))

### Collapse `try`/`send`

The effect of using `try(:something)` or `send(:something)` are essentially the same as calling `something`, so Railroader now converts calls to `try`/`send` directly to the method being called. 

For example:

    User.find(1).try(:name)

is changed to

    User.find(1).name

This can help find more vulnerabilities as well as prevent some false positives if the method name is actually something safe like `id`.

([changes](https://github.com/presidentbeef/railroader/pull/412))

### Block Scoping

Several issues with blocks were fixed in this release. First, no calls with blocks were being processed correctly inside controllers. Secondly, instance variable assignments inside blocks were treated like local assignments. They are now treated as "method level" assignments (i.e. every method has its own "global" scope). Finally, local assignments inside blocks to existing variables were also being treated as block-local assignments.

([changes](https://github.com/presidentbeef/railroader/pull/407))

### Warning Typos

Two tiny changes have been made to warning messages. The "translate bug" from ages ago had an extra `}` in the message, and the message for unsafe reflection no longer capitalizes "Reflection". But since everyone is using [warning fingerprints and not relying on matching messages](http://railroaderscanner.org/blog/2013/05/20/railroader-2-dot-0-0-released/), you should be okay, right?

([changes](https://github.com/presidentbeef/railroader/pull/411))

### Signed Gems

The Railroader gems are now signed and can be verified with [this certificate](https://github.com/presidentbeef/railroader/blob/master/railroader-public_cert.pem).

To verify on installation:

    gem cert --add <(curl -Ls https://raw.github.com/presidentbeef/railroader/master/railroader-public_cert.pem)
    gem install railroader -P MediumSecurity

"HighSecurity" requires all dependencies to be signed as well, which is unlikely.

Additionally, here are the SHA sums for this release:

    2ae503781c51a69a1123d37d46b4813ea91f01e8  railroader-2.3.0.gem
    77d39eaf0e2663af526dcbf6e3b5bac16173fed1  railroader-min-2.3.0.gem

### Railroader Users

We have a new page on this website [listing companies which use Railroader](http://railroaderscanner.org/railroader_users/).

Please contact us ([see bottom of page](http://railroaderscanner.org/railroader_users/)) to have your company listed!

### Stickers

Railroader stickers are still available!

<blockquote class="twitter-tweet" lang="en"><p>Wish you were getting one of these? Just send your name and address to stickers@railroader.org and you will be next! <a href="http://t.co/qXdnGVo6hG">pic.twitter.com/qXdnGVo6hG</a></p>&mdash; Railroader Scanner (@railroader) <a href="https://twitter.com/railroader/statuses/403546302119563264">November 21, 2013</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

### Reporting Issues

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Also consider joining the [mailing list](http://railroaderscanner.org/contact/) or following [@railroader](https://twitter.com/railroader) on Twitter.
