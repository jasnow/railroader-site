---
layout: post
title: "Railroader 3.3.4/3.3.5 Released"
date: 2016-08-12 08:26
comments: true
categories: 
---

This is a quick release to add warnings for [CVE-2016-6316](https://groups.google.com/d/msg/ruby-security-ann/8B2iV2tPRSE/JkjCJkSoCgAJ) and [CVE-2016-6317](https://groups.google.com/d/msg/ruby-security-ann/WccgKSKiPZA/9DrsDVSoCgAJ). There was a bug in 3.3.4 that affected debug output which has been fixed in 3.3.5.

*Changes since 3.3.3*:

* Add generic warning for CVE-2016-6316
* Warn about dangerous use of `content_tag` with CVE-2016-6316
* Add warning for CVE-2016-6317
* Use Minitest

*Changes since 3.3.4*:

* Fix bug in reports when using `--debug` 

### CVE-2016-6316

Typically Rails will escape attribute values passed to tag helpers like `content_tag`. If the attribute has already been marked as "safe" with `.html_safe` or (more likely) a different escaping helper like `sanitize`, the tag helper will not escape the value again (that is the purpose of `.html_safe`). However, not all sanitizers/escape methods escape double quotes, which are dangerous inside of tag attributes. In particular, double quotes allow an attacker to close the current attribute and insert new attributes (like `onmouseover`) that can execute JavaScript.

Railroader will issue a generic warning about CVE-2016-6316 for affected versions and may generate warnings for potentially dangerous calls to `content_tag`.

([changes](https://github.com/presidentbeef/railroader/pull/917))

### CVE-2016-6317

The [JSON bug](https://groups.google.com/d/msg/rubyonrails-security/8SA-M3as7A8/Mr9fi9X4kNgJ) is back. Specially-crafted queries can cause parameters to be interpreted as empty hashes, which may cause unexpected behavior in SQL queries.

Railroader will generate a generic warning for affected versions (4.2 series).

([changes](https://github.com/presidentbeef/railroader/pull/918))

### Minitest

Unrelated, Railroader now uses Minitest instead of test-unit.

([changes](https://github.com/presidentbeef/railroader/pull/912/))

### SHAs

The SHA256 sums for this release are

    7231e00bdb4353ee7e91e5f1e60e34cf29b5563e6f7e1e5478223e72568c493a  railroader-3.3.5.gem
    c07e282c2e1733f8d7db4a4ffefe22e7e38a62ddfd750f0866c0b49070cb61c9  railroader-lib-3.3.5.gem
    a7f8e6fa8eb4254b7ad17080180289794a02641b1f2ec362de57cfdb2f1535be  railroader-min-3.3.5.gem

### Reporting Issues

Thank you to everyone who reported bugs.

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Also consider following [@railroader](https://twitter.com/railroader) on Twitter and hanging out [on Gitter](https://gitter.im/presidentbeef/railroader) for questions and discussion.
