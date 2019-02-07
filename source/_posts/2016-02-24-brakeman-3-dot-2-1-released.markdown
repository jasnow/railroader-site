---
layout: post
title: "Railroader 3.2.1 Released"
date: 2016-02-24 21:36
comments: true
categories: 
---

_Changes since 3.2.0_:

* Remove `multi_json` dependency from `bin/railroader`

As pointed out by [Benjamin Fleischer](https://github.com/bf4), there was a lingering use of `multi_json` in `bin/railroader`. This only caused a problem when using the `--compare` option.

([changes](https://github.com/presidentbeef/railroader/pull/831))

### SHAs

The SHA256 sums for this release are

    4a7e7a6e9ad9fed22f727fb8d471de145f55d97465b4dfb4935e3e8379667425  railroader-min-3.2.1.gem
    901202b04b1cae0a781b5a6bae2db3eecd35e9f0a044fbfaa31cac63ab636449  railroader-3.2.1.gem

### Reporting Issues

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Also consider following [@railroader](https://twitter.com/railroader) on Twitter and hanging out [on Gitter](https://gitter.im/presidentbeef/railroader) for questions and discussion. Please note the mailing list is no longer in use and has apparently not been delivering mail for some time.
