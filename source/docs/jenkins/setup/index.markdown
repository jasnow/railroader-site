---
layout: page
title: "Jenkins Job Setup"
date: 2011-08-30 15:04
comments: false
sharing: false
footer: true
---

The main goal when setting up a job is to have Jenkins run Railroader, and then the plugin will read the results.

Ruby must be installed on the Jenkins server.

## Enable the plugin

On the job configuration page, check the box next to "Publish Railroader warnings". On newer builds of Jenkins, you'll find this under the "Add post-build action" dropdown at the bottom of the page.

The plugin will look for an output file from Railroader in the work directory. The name of the output file can be specified here, but the default should be fine.

## Set Job to Run Railroader

Click "Add Build Step" and then "Execute shell".

This is the tricky part, and it depends on how Ruby is set up on the server. The important part is that the output from Railroader needs to be in the `tabs` format.

### Without RVM

If Ruby is installed globally, then this should work:

    gem install railroader --no-ri --no-rdoc &&    
    railroader -o railroader-output.tabs

### With RVM

If [RVM](http://beginrescueend.com/) is installed on the server:

    bash -l -c '
    gem install railroader --no-ri --no-rdoc &&
    railroader -o railroader-output.tabs'

It might make sense to also set up a separate gemset:

    bash -l -c '
    rvm gemset create my-railroader-job &&
    rvm gemset use my-railroader-job &&
    gem install railroader --no-ri --no-rdoc &&
    railroader -o railroader-output.tabs'
