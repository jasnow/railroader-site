---
layout: post
title: "Railroader 1.5.1 Released"
date: 2012-03-05 18:50
comments: true
categories: 
---

After the excitment yesterday with a mass assignment vulnerability being exploited in a very public manner on [Github](https://gist.github.com/1978249), interest in Railroader has skyrocketed.

This lead to re-examination of Railroader's code for detecting that mass assignment has been globally disabled - and it turns out there was a bug or two. So here is a bug-fix release of Railroader to correct that and some other minor issues.

Upgrading to 1.5.1 may increase the number of warnings reported.

_Changes since 1.5.0_:

 * Fix detection of global mass assignment setting
 * Fix partial rendering in Rails 3
 * Show backtrace when interrupt received (Ruby 1.9 only)
 * More debug output
 * Internal fixes:
   * Remove duplicate method in Railroader::Rails2XSSErubis
   * Add tracking of module and class to Railroader::BaseProcessor
   * Report module when using Railroader::FindCall

### Mass Assignment

Mass assignment is not a particularly new issue, but the amount of attention suddenly focused on it this weekend was amazing.

This release of Railroader can detect three different methods for defaulting all models to a whitelist of allowed attributes that can be mass assigned.

The first is probably the most widely-seen version. In an intializer, do

    ActiveRecord::Base.send(:attr_accessible, nil)

The second is essentially equivalent, but 1.5.1 adds support for it as well:

    module ActiveRecord
      class Base
        attr_accessible nil
      end
    end

The third option is only available for Rails 3.1.0 and newer. The following configuration setting can be added to `application.rb`:

    config.active_record.whitelist_attributes = true

Railroader should correctly detect all of these.

[This is a very nice post](http://pragtob.wordpress.com/2012/03/06/secure-your-rails-apps/) explaining the dangers of mass assignment (mentioning Railroader is nice, too.)

### Partials in Rails 3

In Rails 3, `render 'blah'` is now equivalent to `render :partial => 'blah'` when used inside a template.

Railroader now supports this correctly.

### Debug Output

More debugging output has been added for use with the `-d` option.

Additionally, when interrupting the application (for example, with `^C`), a stack trace will be output. Please note, however, that this only works with Ruby 1.9.

### Internal Changes

There have been a few internal changes. There is a possibility that these will affect some warnings. However, it should only result in accurate reporting of class names.

### Report Issues

Please report any problems on [Github](https://github.com/presidentbeef/railroader/issues)!
