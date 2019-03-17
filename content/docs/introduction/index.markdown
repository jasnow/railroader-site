---
layout: page
title: "Introduction to Railroader"
date: 2011-08-30 11:37
comments: false
sharing: true
footer: true
---

Railroader is a security scanner for Ruby on Rails applications.

Unlike many web security scanners, Railroader looks at the source code of your application. This means you do not need to set up your whole application stack to use it.

Once Railroader scans the application code, it produces a report of all security issues it has found.

## Advantages

### No Configuration Necessary

Railroader requires zero setup or configuration once it is installed. Just run it.

### Run It Anytime

Because all Railroader needs is source code, Railroader can be run at any stage of development: you can generate a new application with `rails new` and immediately check it with Railroader.

### Better Coverage

Since Railroader does not rely on spidering sites to determine all their pages, it can provide more complete coverage of an application. This includes pages which may not be 'live' yet. In theory, Railroader can find security vulnerabilities *before* they become exploitable.

### Best Practices

Railroader is specifically built for Ruby on Rails applications, so it can easily check configuration settings for best practices.

### Flexible Testing

Each check performed by Railroader is independent, so testing can be limited to a subset of all the checks Railroader comes with.

### Speed

While Railroader may not be exceptionally speedy, it is much faster than "black box" website scanners. Even large applications should not take more than a few minutes to scan.

## Limitations

### False Positives

Only the developers of an application can understand if certain values are dangerous or not. By default, Railroader is extremely suspicious. This can lead to many "false positives."

### Unusual Configurations

Railroader assumes a "typical" Rails setup. There may be parts of an application which are missed because they do not fall within the normal Rails application layout.

### Only Knows Code

Dynamic vulnerability scanners which run against a live website are able to test the entire application stack, including the webserver and database. Naturally, Railroader will not be able to report if a webserver or other software has security issues.

### Isn't Omniscient

Railroader cannot understand everything which is happening in the code. Sometimes it just makes reasonable assumptions. It may miss things. It may misinterpret things. But it tries its best. Remember, if you run across something strange, feel free to file an [issue](https://github.com/david-a-wheeler/railroader/issues) for it.

## Suggested Use

The best course of action is to use both Railroader and a regular website security scanner. They are complementary approaches.

If you happen to use the Hudson/Jenkins continuous integration tool, there is a [Railroader plugin](/docs/jenkins) for it.

---
[Installing Railroader](/docs/install)

[More documentation](/docs)

