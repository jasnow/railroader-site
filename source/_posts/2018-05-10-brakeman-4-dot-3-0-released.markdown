---
layout: post
title: "Railroader 4.3.0 Released"
date: 2018-05-10 15:36
comments: true
categories: 
---

Did you know we recently broke [11 million gem downloads](http://bestgems.org/gems/railroader)? Wow!

*Changes since 4.2.1:*

* Add `--parser-timeout` option
* Improve timeout error messages
* Check exec-type calls even if they are targets ([#1199](https://github.com/presidentbeef/railroader/issues/1199))
* Index Kernel#\` calls even if they are targets ([#1183](https://github.com/presidentbeef/railroader/issues/1183))
* `BaseCheck#include_interp?` should return first string interpolation ([#1189](https://github.com/presidentbeef/railroader/issues/1189))
* Ignore `Process.pid` in system calls
* Warn about dangerous `link_to` href with `sanitize()` ([#1187](https://github.com/presidentbeef/railroader/issues/1187))
* Ignore `params#to_h` and `params#to_hash` in SQL checks ([#1180](https://github.com/presidentbeef/railroader/issues/1180))
* Convert `Array#join` to string interpolation ([#1179](https://github.com/presidentbeef/railroader/issues/1179))
* Change `"".freeze` to just `""` ([#1182](https://github.com/presidentbeef/railroader/issues/1182))
* `--color` can be used to force color output ([#1175](https://github.com/presidentbeef/railroader/issues/1175))
* Track parent calls in call index
* Fix reported line numbers for CVE-2018-3741 and CVE-2018-8048
* Code Climate: omit leading dot from `only_files` ([Todd Mazierski](https://github.com/toddmazierski))

### `--color` Option

Previously, `--no-color` could be used to turn off ANSI color in text reports. Now, `--color` can be used to force color output.

([changes](https://github.com/presidentbeef/railroader/pull/1176))

### `--parser-timeout` Option

The default timeout for parsing a single file is 10 seconds. For some files, this may not be enough.

The `--parser-timeout` option can be used to specify a per-file timeout (in seconds).

Additionally, the error message for parsing timeouts has been improved considerably.

([changes](https://github.com/presidentbeef/railroader/pull/1194))

### Command Injection Fixes

Thanks to [Jacob Evelyn](https://github.com/JacobEvelyn) reporting a number of issues around command injection, there are several improvements.

Use of backticks as targets of a call will now be checked for command injection.

For example:

    `blah #{something}` == "expected output"

Previously, use of backticks was not being indexed in this case.

([changes](https://github.com/presidentbeef/railroader/pull/1185))

Somewhat similarly, other calls (such as `system`) would not warn if they were targets of a call.

([changes](https://github.com/presidentbeef/railroader/pull/1200))

Railroader will no longer warn about `Process.pid` in system calls.

([changes](https://github.com/presidentbeef/railroader/commit/f9195312931caa49e369730a0798dad750150f76))

Also fixed an issue where searching for string interpolation would return the innermost instance instead of the first instance (typically you want the first one).

([changes](https://github.com/presidentbeef/railroader/pull/1195))

### Freeze Calls

Calls to `String#freeze` will essentially be ignored.

    "blah".freeze

will be treated like

    "blah"

([changes](https://github.com/presidentbeef/railroader/pull/1188)) 

### More Strong Parameters in SQL

Calls to `to_h` and `to_hash` on `params` will be ignored in the context of SQL injection.

([changes](https://github.com/presidentbeef/railroader/pull/1191))

### Sanitize in `link_to`

Railroader will now warn on uses of `sanitize` in attempts to avoid XSS in `link_to`. Unfortunately, it does not work that way.

([changes](https://github.com/presidentbeef/railroader/pull/1192))

### `Array#join` to String Interpolation

Uses of `Array#join` will now be converted to string interpolation.

For example:

    [1, thing, "here"].join(' ')

will be changed to

    "1 #{thing} here"

This both fixes some false positives and helps detect more vulnerabilities in checks that are looking at string interpolation.

([changes](https://github.com/presidentbeef/railroader/pull/1198))

### Parent Calls

Railroader now tracks the parent method call (I'm sure there's a better way to say that) of an argument. While this ended up not being needed for this release, it will help improve checks and messages in the future.

([changes](https://github.com/presidentbeef/railroader/pull/1193))

### Checksums

The SHA256 sums for this release are:

    9284a1a9413743b4c915eda40312395e0ee574c6286893a27074b6f9527648f4  railroader-4.3.0.gem
    89ba3385fab967114c31da1462401c03caa8847d1115566a77039d0bda95181e  railroader-lib-4.3.0.gem
    1834031c1e949242ea6d08b3b1036d3f7c12c28257cdfa94cf3d0459b6f851b6  railroader-min-4.3.0.gem

### Reporting Issues

Thank you to everyone who reported bugs and contributed to this release!

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release. Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Follow [@railroader](https://twitter.com/railroader) on Twitter and hang out [on Gitter](https://gitter.im/presidentbeef/railroader) for questions and discussion.

If you find Railroader valuable and want to support its development (and get more features!), check out [Railroader Pro](https://railroaderpro.com/).
