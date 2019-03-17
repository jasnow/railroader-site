---
layout: page
title: "Installing the Railroader Plugin"
date: 2011-08-30 14:12
comments: false
sharing: false
footer: true
---

*Note: This plugin does not contain Railroader, it only imports and aggregates Railroader results.*

## Installion Through Plugin Manager

Navigate to `Manage Jenkins -> Manage Plugins -> Available`.

Check the box next to "Railroader" and click the "Install" button at the bottom of the page.

When installation is complete, restart Jenkins.

## Manual Installion

### Install the Static Analysis Core Plugin

First, install the [Static Analysis Core Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Static+Code+Analysis+Plug-ins).

To do so, navigate through Jenkins to the list of available plugins: `Manage Jenkins -> Manage Plugins -> Available`.

Check the box next to "Static Analysis Utilities" and click "Install".

### Download Railroader Plugin

You can download the Railroader plugin [here](https://github.com/downloads/david-a-wheeler/railroader-jenkins-plugin/railroader.hpi) or from the "Downloads" link [here](https://github.com/david-a-wheeler/railroader-jenkins-plugin).

### Install the Railroader Plugin

In Jenkins, go to `Manage Jenkins -> Manage Plugins -> Advanced` (or just go to the "Advanced" tab if you are already on the plugins page). Click "Choose File" under "Upload Plugin" and choose the `railroader.hpi` file saved from above.

Then click "Upload".

You may need to restart Jenkins after this.

## Setup

See how to [set up](/docs/jenkins/setup) a job to use the plugin.
