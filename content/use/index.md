Once you have [installed Railroader](/install),
you can then analyze your software any time.


Using the command line,
make sure your current directory is at the top of your application.
Then just run `railroader`, like this:

~~~~sh
railroader
~~~~

It will analyze the software and report any warnings.

Since it's easy to run,
it's easy to integrate into your continuous integration (CI)
pipeline.
Railroader returns failure (nonzero) if there's a problem, so just
add it to the set of commands that should normally succeed.
