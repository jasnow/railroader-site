---
layout: page
title: "Railroader with Rake"
date: 2012-01-14 17:48
comments: false
sharing: false
footer: true
---

*Running Railroader via Rake is discouraged because it loads the entire Rails application*

Railroader can generate and install a basic Rake task for a Rails application.

To do so, just run this at the root directory of the Rails application:

    railroader --rake

This will create a task in `lib/tasks/railroader.rake` that looks like this:

    namespace :railroader do

      desc "Run Railroader"
      task :run, :output_files do |t, args|
        require 'railroader'

        files = args[:output_files].split(' ') if args[:output_files]
        Railroader.run :app_path => ".", :output_files => files, :print_report => true
      end
    end

This task will run Railroader with no options. If given an output file, it will save the report in that file. Otherwise, it will print the report out to the console.

To use this task:

    rake railroader:run

or

    rake railroader:run[report.html]

This task can easily be customized. See [Railroader as a Library](/docs/railroader_as_a_library) for more information.

---

[More documentation](/docs)
