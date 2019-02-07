---
layout: post
title: "Railroader 1.9.2 Released"
date: 2013-02-13 15:48
comments: true
categories: 
---

This release is almost entirely enhancements to old checks or new checks for recent vulnerabilities. New features in the next release, I promise.

*Changes since 1.9.1*:

 * Add check for CVE-2013-0269
 * Add check for CVE-2013-0276
 * Add check for CVE-2013-0277
 * Add check for CVE-2013-0333
 * Check for more send-like methods ([joernchen](https://github.com/joernchen))
 * Check for more SQL injection locations
 * Check for more dangerous YAML methods ([#246](https://github.com/presidentbeef/railroader/issues/246))
 * Support MultiJSON 1.2 for Rails 3.0 and 3.1 ([#247](https://github.com/presidentbeef/railroader/issues/247))

### CVE-2013-0269 - Vulnerabilities in JSON gems

[CVE-2013-0269](https://groups.google.com/d/topic/rubyonrails-security/4_YvCpLzL58/discussion) is not strictly a Rails issue, but since it was announced on the Rails security list and was relatively easy to check, Railroader will warn on it.

Versions of the json/json\_pure gem on the 1.7.x branch will raise remote code execution warnings, while any other affected version will be reported as a denial of service vulnerability.

Applications which do not parse user input are not affected by these issues, but it is a good idea to upgrade anyway, as it should be relatively painless.

([changes](https://github.com/presidentbeef/railroader/pull/262))

### CVE-2013-0276 - attr_protected Bypass

Railroader has been warning on uses of `attr_protected` since version 1.4.0, but it was reported with weak confidence, since it is really a best-practice issue.

Now, however, uses of `attr_protected` will be reported as medium confidence unless used in a Rails version affected by [CVE-2013-0276](https://groups.google.com/d/topic/rubyonrails-security/AFBKNY7VSH8/discussion), in which case it will be high confidence.

([changes](https://github.com/presidentbeef/railroader/pull/262))

### CVE-2013-0277 - Serialized Attributes

[CVE-2013-0277](https://groups.google.com/d/topic/rubyonrails-security/KtmwSbEpzrU/discussion) allows attackers to insert malicious YAML into serialized model attributes. Using `attr_accessible` or `attr_protected` somewhat mitigates this, but it is still possible for an application to manually assign user input to a serialized attribute.

Railroader will warn on affected models, with confidence level depending on whether or not the attribute can be mass assigned.

([changes](https://github.com/presidentbeef/railroader/pull/262))

### CVE-2013-0333 - JSON Parsing Vulnerability

[CVE-2013-0333](https://groups.google.com/d/topic/rubyonrails-security/1h2DR63ViGo/discussion) is another side effect of the recent YAML vulnerabilities. Rails' default JSON request parser converted requests to YAML then parsed them as YAML.

Railroader will warn on affected versions unless the provided workaround (setting the JSON backend to `JSONGem`) is present.

([changes](https://github.com/presidentbeef/railroader/pull/254))

### Check for More Send-like Methods

Thanks to joernchen, Railroader will now warn if user input is passed to `try`, `public_send`, or `__send__`.

([changes](https://github.com/presidentbeef/railroader/pull/256))

### Check for More SQL Injection Sites

While researching for [rails-sqli.org](http://rails-sqli.org/), a few more methods came up for Railroader to check.

Railroader will now warn on SQL injection in `update_all` and `pluck` methods.

### Check for More Dangerous YAML Methods

Railroader will now warn on dangerous uses of `load_documents`, `load_stream`, `parse_documents`, and `parse_stream`.

([changes](https://github.com/presidentbeef/railroader/pull/249))

### Support MultiJSON 1.2

The MultiJSON gem changed some APIs around version 1.3. For convenience, Railroader supported 1.3 or higher. However, for the same reason, Rails 3.0 and 3.1 are locked at versions before 1.3.

For those using Rails 3.0 or 3.1 and including Railroader in the Gemfile, Railroader now supports both the old and new interfaces for MultiJSON and the depedency has been pushed back to MultiJSON 1.2.

([changes](https://github.com/presidentbeef/railroader/pull/248))

### Report Issues

Please report any [issues](https://github.com/presidentbeef/railroader/issues) with this release! Take a look at [this guide](https://github.com/presidentbeef/railroader/wiki/How-to-Report-a-Railroader-Issue) to reporting Railroader problems.

Also consider joining the [mailing list](http://railroaderscanner.org/contact/) or following [@railroader](https://twitter.com/railroader) on Twitter.

Finally, please check out [rails-sqli.org](http://rails-sqli.org/) and send in any feedback. Thanks!
