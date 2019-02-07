---
layout: post
title: "Railroader 3.1.3 Released"
date: 2015-12-02 09:23
comments: true
---

This is a small bug fix release, except for one major new feature: [Railroader is now available as an engine on the new Code Climate platform](https://codeclimate.com/changelog/5653c9b67f7feb0048003051)!

_Changes since 3.1.2_:

* Add Code Climate output format ([Ashley Baldwin-Hunter](https://github.com/ABaldwinHunter) / [Devon Blandin](https://github.com/dblandin) / [John Pignata](https://github.com/presidentbeef/railroader/pull/759) / [Michael Bernstein](https://github.com/mrb))
* Restore minimum Highline version ([Kevin Glowacz](https://github.com/kjg))
* Depend on safe\_yaml 1.0 or later ([#753](https://github.com/presidentbeef/railroader/issues/752))
* Check for session secret in secrets.yml ([#760](https://github.com/presidentbeef/railroader/issues/760))
* Avoid warning on `without_protection: true` with hash literal ([#769](https://github.com/presidentbeef/railroader/issues/769))
* Respect `exit_on_warn` in config file ([#771](https://github.com/presidentbeef/railroader/pull/771))
* Avoid outputting false for `user_input` in JSON
* Iteratively replace variables
* CallIndex improvements
* Improved tests for the Railroader module ([Bethany Rentz](https://github.com/bethanyr)) 
* Make sure a `before_filter` with block is a call ([#763](https://github.com/presidentbeef/railroader/issues/763))

### Code Climate Platform

Thanks to the folks at [Code Climate](https://codeclimate.com/), this release adds the ability to run Railroader as an analysis engine on [Code Climate’s platform](https://codeclimate.com/changelog/5653c9b67f7feb0048003051). You can now run Railroader as part of Code Climate’s hosted analysis, or on your command line with their open source CLI. Railroader can be integrated with results from your other favorite static analysis tools, giving you a unified view of issues in your code.

([main changes](https://github.com/presidentbeef/railroader/pull/758))

### Dependencies

Railroader 3.1.0 relaxed the [Highline](https://github.com/JEG2/highline) dependency (to support Highline 1.7.x and up) and Railroader 3.1.2 added a dependency on [safe_yaml](https://github.com/dtao/safe_yaml) without specifying a minimum version. Both of these changes resulted in some issues if combined with an application that depends on older versions of these libraries.

Highline and safe\_yaml now have minimum versions specified.

(changes [here](https://github.com/presidentbeef/railroader/pull/762) and [here](https://github.com/presidentbeef/railroader/pull/753))

### More Secrets

Production session secrets stored in `config/secrets.yml` will now raise a warning.

([changes](https://github.com/presidentbeef/railroader/pull/776)

### Mass Assignment False Positive

Previously, Railroader would warn on any mass assignment using `without_protection: true`. [This blog post](https://carouselapps.com/2015/11/24/using-railroader/) noted Railroader would even warn if the values for mass assignment were a hash literal. This has been fixed.

([changes](https://github.com/presidentbeef/railroader/pull/773))

### Harcode Mode in Config

Railroader now supports turning on "hardcore mode" (setting `:exit_on_warn: true`) in a config file. This causes Railroader return a non-zero exit code if any warnings are found.

([changes](https://github.com/presidentbeef/railroader/pull/774))

### JSON Output

A refactoring caused some values of `user_input` in JSON reports to be `false` instead of `nil`. This has been corrected.

([changes](https://github.com/presidentbeef/railroader/pull/756))

### More Variable Replacement

A long time ago, Railroader used to do two passes for data flow analysis, just in case one substitution could be replaced with yet another value. The second pass was removed when it turned out not to be that helpful in reality. However, there are some cases where it is helpful. Now Railroader will attempt substitutions if there are more matches, but with a hard limit of 5 replacements to avoid infinite loops. This will reduce false positives in some situations.

([changes](https://github.com/presidentbeef/railroader/pull/757))

### CallIndex Improvements

Fixed a small bug where `params` was not a valid target when searching chained methods, as well as making it possible to search for chains beginning with a method call. Additionally, all the tests for CallIndex were broken and not testing anything.

([changes](https://github.com/presidentbeef/railroader/pull/766))

### Improved Test Coverage

Thanks to [Bethany Rentz](https://github.com/bethanyr), [test coverage](https://codeclimate.com/github/presidentbeef/railroader/coverage) was nudged up over 90%. Plenty of low-hanging fruit remains, [see this issue](https://github.com/presidentbeef/railroader/issues/723) for suggestions of how to contribute!

([changes](https://github.com/presidentbeef/railroader/pull/735))

### Railroader Pro

Another small announcement: the first public release of [Railroader Pro](http://railroaderscanner.org/railroader_pro/) (the commercial version of Railroader) is now available for purchase. If you are looking to financially support development of Railroader, would like paid support, need a commercial license, or just want a slick GUI, consider checking out [Railroader Pro](https://railroaderpro.com/).

For some clarification regarding the future of Railroader and Railroader Pro, please see [this email from earlier in the year](http://librelist.com/browser//railroader/2015/2/24/future-of-railroader/).

### SHAs

The SHA256 sums for this release are

    57b0edcc289eb74359d2042a38ea519f96f606c89dc879e5fb53971d3d656707  railroader-3.1.3.gem
    85473af3a55c440959ea91f94fe14177ac58aa35b44fbb007c93cd742803eae6  railroader-min-3.1.3.gem

### Reporting Issues

Thank you to everyone who reported bugs and contributed improvements in this release.

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Also consider following [@railroader](https://twitter.com/railroader) on Twitter, joining the [mailing list](http://railroaderscanner.org/contact/), or hanging out [on Gitter](https://gitter.im/presidentbeef/railroader).

