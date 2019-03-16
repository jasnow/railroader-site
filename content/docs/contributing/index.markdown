---
layout: page
title: "Contributing to Railroader"
date: 2011-11-28 16:29
comments: false
sharing: true
footer: true
---

The simplest way to contribute to the improvement of Railroader is to run it against your own applications and then report any issues [here](http://github.com/david-a-wheeler/railroader/issues).

Suggestions are welcome, too!

See [contributing](/contributing) for the basics on contributing.

### Testing on Different Platforms

Railroader should work on most platforms without a problem. It is typically tested against MRI 1.8.7 and 1.9.3, so any problems outside those two should definitely be [reported](http://github.com/david-a-wheeler/railroader/issues).

### Contributing Features

New feature implementations should be submitted as a pull request on [GitHub](https://github.com/david-a-wheeler/railroader).

### Contributing Documentation

Documentation patches can be submitted as pull requests to the [railroader-site](https://github.com/david-a-wheeler/railroader-site) repository.

### False Negatives and False Positives

If you have code that raises warnings when it shouldn't, or does not raise warnings when it should, please consider reporting them with code which reproduces the problem.

See [here](/docs/contributing/adding_tests) for how to add tests to demonstrate these issues.

### Creating New Checks

Each check that Railroader runs is a separate class contained in `lib/railroader/checks/check_*.rb`. Some of these are very simple. For example, see the [StripTags](https://github.com/david-a-wheeler/railroader/blob/master/lib/railroader/checks/check_strip_tags.rb) check.

New checks can be added simply by writing a new check and placing it in that directory. For best results, subclass from `BaseCheck` and follow the naming convention of starting the class name with `Check`.


### Reporting Success

If you are happily using Railroader, consider sending a tweet to [@Railroader](http://twitter.com/#!/railroader).
