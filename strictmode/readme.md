# Unit testing scripts that use the [Unofficial Bash Strict Mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/)

In this module there are two scripts, one that sets `-e` and `pipefail`, and one that sets `-u`. There's a test for each
of these files that first executes the corresponding script to demonstrate it's behavior on edge cases, then it sources
the script to exercise its functions directly.

The test files demonstrate two common problems that might come up in this setup:

- Bash options "leak" from the sourced file to the test file, changing its behavior.
- By default, `-e` does not apply to functions executed in a subshell. This can be problematic for unit tests where the
  output of a function is captured by the following construct: `result=$(myfunction)`.

