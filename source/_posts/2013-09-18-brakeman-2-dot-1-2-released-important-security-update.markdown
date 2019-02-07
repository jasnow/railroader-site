---
layout: post
title: "Railroader 2.1.2 Released - Important Security Update"
date: 2013-09-18 01:38
comments: true
categories: 
---

*Important*: Contrary to the "Railroader Philosophy," there is one situation in which Railroader attempts to load files from an application. This is a security risk since the code in the files would be executed (typical `require` behavior). Note that this is only a real problem if running Railroader against code outside one's control. Since most users are scanning their own code, this should not be a concern for the majority of Railroader users.

*Changes since 2.1.1:*

 * Do not attempt to load custom Haml filters
 * Do not warn about `to_json` XSS in Rails 4
 * Remove fuzzy matching on dangerous `attr_accessible` values
 * Add --table-width option to set width of text reports ([ssendev](https://github.com/ssendev))

### Custom Haml Filters

Railroader no longer attempts to load custom Haml filters. This was a hack (from nearly three years ago) to help compile some Haml templates. It was recently noted that this introduces a security risk when scanning untrusted code.

For now, custom Haml filters will cause a Railroader error and the Haml templates using them will not be scanned.

([changes](https://github.com/presidentbeef/railroader/commit/8a6ae98df3039bf5f3d7cc0852efb1006362f143#L1L3))

### JSON Output in Rails 4

As of Rails 4, the output of `to_json` is now safe by default. Railroader should no longer warn about cross-site scripting with `to_json` in Rails 4 applications.

([changes](https://github.com/presidentbeef/railroader/pull/392))

### Less Fuzzy Mass Assignment

Railroader no longer uses fuzzy matching for potentially dangerous model attributes allowed for mass assignment, such as any value containing `admin`.

([changes](https://github.com/presidentbeef/railroader/pull/390))

### Text Report Width Option

The width of text reports can now be controlled with the `--table-width` option. For example, this can be useful when capturing text output to a file.

([changes](https://github.com/presidentbeef/railroader/pull/387))

### Reporting Issues

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Also consider joining the [mailing list](http://railroaderscanner.org/contact/) or following [@railroader](https://twitter.com/railroader) on Twitter.
