---
layout: post
title: "Railroader 3.7.0 Released"
date: 2017-06-29 18:00
comments: true
categories: 
---

_Changes since 3.6.2_:

* Avoid interpolating hashes/arrays on failed access ([#921](https://github.com/presidentbeef/railroader/issues/921))
* Fix false positive for `redirect_to` in Rails 4 ([Mário Areias](https://github.com/mario-areias))
* Show progress indicator in interactive mode ([#1012](https://github.com/presidentbeef/railroader/issues/1012))
* Handle simple conditional guards that use `return` ([#1057](https://github.com/presidentbeef/railroader/issues/1057))
* Improve support for `rails4`/`rails5` options in config file ([#1059](https://github.com/presidentbeef/railroader/issues/1059))
* Updated RubyParser to master

### Performance Improvement with Hash/Array Accesses

When Railroader sees a hash or array access that it cannot resolve (i.e. can't find the value for the key), it will no longer copy the entire hash/array value to the call site.

For some applications, this will significantly improve performance.

This may cause some warning fingerprints to change.

([changes](https://github.com/presidentbeef/railroader/pull/1056))

### Unsafe Hash in Redirects

Thanks to [Mário Areias](https://github.com/mario-areias), Railroader correctly handles `to_unsafe_hash` and `to_unsafe_h` in `redirect_to`.

([changes](https://github.com/presidentbeef/railroader/pull/1029))

### Progress Indicator in Interactive Mode

When using `-I` to manage false positives, Railroader will now show how far you are through the warnings.

![image](https://user-images.githubusercontent.com/75613/27519704-f7c60006-59ad-11e7-82e8-ce0e096ad678.png)

([changes](https://github.com/presidentbeef/railroader/pull/1064))

### Simple Guards with Return

Railroader can now recognize _simple_ guard conditions such as:

    return unless [:safe, :values].include? params[:x]

([changes](https://github.com/presidentbeef/railroader/pull/1062))

### Rails Version Option in Railroader Configuration

It is now possible to specify just `:rails4: true` or `:rails5: true` in a Railroader configuration file.

([changes](https://github.com/presidentbeef/railroader/pull/1066))

### Updated RubyParser

The main `railroader` gem bundles as-of-yet unreleased changes in RubyParser. This includes "squiggly heredoc" support (`<<~`), improved line numbers, and a few other fixes.


### Checksums

The SHA256 sums for this release are:

    f46550d7c7827644a5663ccc10a6ca222e2534648f68630e3a777cb73df59824  railroader-3.7.0.gem
    0ea5359ae802284695500b92a03bf1d022574953a0da44607ff7f715f456c37e  railroader-min-3.7.0.gem
    f6f17e9f1f71a68b486d68f2b3413607fb47154a0fb6a6da23d9d7be87f37967  railroader-lib-3.7.0.gem

### Reporting Issues

Thank you to everyone who reported bugs and contributed to this release.

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Follow [@railroader](https://twitter.com/railroader) on Twitter and hang out [on Gitter](https://gitter.im/presidentbeef/railroader) for questions and discussion.

If you find Railroader valuable and want to support its development, check out [Railroader Pro](https://railroaderpro.com/).
