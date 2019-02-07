---
layout: post
title: "Railroader 3.0.2 Released"
date: 2015-03-09 14:54
comments: true
categories: 
---

This is entirely a bugfix release, no new features. However, the fixes may cause line numbers and warning fingerprints to change.

*Changes since 3.0.1*:

* Fix HTML reports with GitHub repos ([#624](https://github.com/presidentbeef/railroader/issues/624))
* Handle processing of explictly shadowed block arguments ([#612](https://github.com/presidentbeef/railroader/issues/612))
* Fix CSV output when there are no warnings ([#615](https://github.com/presidentbeef/railroader/issues/615))
* Update `ruby_parser` to ~> 3.6.2
* Treat `primary_key`, `table_name_prefix`, `table_name_suffix` as safe in SQL
* Fix using `--compare` and `--add-checks-path` together
* Alias process methods called in class scope on models
* Avoid warning about mass assignment with string literals
* Only report original regex DoS locations
* Report correct file for `simple_format` usage CVE warning
* Ignore case value in XSS checks

### HTML Reports with GitHub Repo

HTML reports were sometimes causing an error when linking to a GitHub repo.

([changes](https://github.com/presidentbeef/railroader/pull/625))

### Shadowed Block Arguments

There was an error handling explicitly shadowed block arguments like this:

    some_array.each do |item; x, y|
      # Stuff
    end

([changes](https://github.com/presidentbeef/railroader/pull/613))

### CSV Output

Empty tables caused the CSV report to fail.

([changes](https://github.com/presidentbeef/railroader/pull/616))

### RubyParser Update

Railroader has been very behind on RubyParser versions due to a line number issue which is nearly always present in HAML templates. As a workaround, Railroader now strips newline literals from HAML templates. While this does cause some line numbers to be off, but typically newline literals are caused by HAML formatting. Removing them allows Railroader to use the latest RubyParser.

Railroader now requires RubyParser 3.6.2 as a minimum. 

([HAML changes](https://github.com/presidentbeef/railroader/pull/620), [dependency change](https://github.com/presidentbeef/railroader/pull/621))

### More SQL-safe Methods

Railroader will no longer warn about `primary_key`, `table_name_prefix`, and `table_name_suffix` in SQL.

([changes](https://github.com/presidentbeef/railroader/pull/635))

### Compare with External Checks

Fix an issue when using `--compare` and `--add-checks-path` together.

([changes](https://github.com/presidentbeef/railroader/pull/635))

### Process Class-Scope Method Calls

Previously, Railroader would process method calls at the class scope (e.g., `belongs_to`) in models and then throw away the call. This meant the call never received data flow analysis. This was particularly noticeable when those calls involved blocks. This has been fixed and has improved results, especially where constants are used.

([changes](https://github.com/presidentbeef/railroader/pull/634))

### Mass Assignment with Literals

Railroader no longer warns about mass assignment if the arguments are a string or symbol. In those cases it probably isn't an ActiveRecord subclass in any case.

([changes](https://github.com/presidentbeef/railroader/pull/631))

### Reduce Regex DoS Duplicates

Duplicate regular expression denial of service warnings were being reported due to data flow analysis.

([changes](https://github.com/presidentbeef/railroader/pull/627))

### File for simple_format CVE

Warnings regarding the old `simple_format` CVE will now point to the file where `simple_format` was called, not the Gemfile.

([changes](https://github.com/presidentbeef/railroader/pull/623/files))

### Ignore Case Value

Do not report about XSS regarding the value used in `case` expressions.

([changes](https://github.com/presidentbeef/railroader/pull/619))

### SHAs

The SHA1 sums for this release are

    87413b544b5eae0cac9f037e2b62b1fe3f0fee5e  railroader-3.0.2.gem
    cfcf3080a992ca173c64dd98fe239e8bd9bb0eaa  railroader-min-3.0.2.gem

### Reporting Issues

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Also consider following [@railroader](https://twitter.com/railroader) on Twitter and joining the [mailing list](http://railroaderscanner.org/contact/).
