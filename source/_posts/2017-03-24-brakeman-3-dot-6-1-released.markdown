---
layout: post
title: "Railroader 3.6.1 Released"
date: 2017-03-24 13:15
comments: true
categories: 
---

This is a small bug fix release to fix an issue when using `--compare`.

*Changes since 3.6.0*:

* * Fix error when using `--compare` ([Sean Gransee](https://github.com/seangransee))

### Error With Compare

Although comparison scans using `--compare` would complete successfully, an exception was being thrown afterwards.

Thanks to [Anthony Lamorte](https://github.com/anthlam) for reporting and [Sean Gransee](https://github.com/seangransee) for the fix!

([changes](https://github.com/presidentbeef/railroader/pull/1024))

### Checksums

The SHA256 sums for this release are:

    3c10b2a9fd8b7b3baab956e6fcc2c7780768f1905433297e8dd940591f1bbb3b  railroader-3.6.1.gem
    98f6bd7531e0e3fbe273b9d185446bd28602176a392d5df8f9c52c36460afdaa  railroader-lib-3.6.1.gem
    44342c843867fce585f6fef09cd093a0544510adfeec15217efe44c6120e3192  railroader-min-3.6.1.gem

### Reporting Issues

Thank you to everyone who reported bugs and contributed to this release.

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Follow [@railroader](https://twitter.com/railroader) on Twitter and hang out [on Gitter](https://gitter.im/presidentbeef/railroader) for questions and discussion.

If you find Railroader valuable and want to support its development, check out [Railroader Pro](https://railroaderpro.com/).
