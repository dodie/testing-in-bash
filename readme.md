# In search of the best test framework for Bash

There are [many testing frameworks for Bash](https://stackoverflow.com/questions/1339416/unit-testing-bash-scripts).
However, many of them are not actively maintained, or are used only by a small group of people.

In this comparision I've included well-established and new testing frameworks that had at least one release in
2019 or 2020, and have more than 50 Stars on GitHub:

- [Bats](https://github.com/bats-core/bats-core), a mature testing library with a bit of a custom syntax for more concise tests
- [shUnit2](https://github.com/kward/shunit2), possibly the oldest Bash test framework around, supporting test files in pure Bash
- [bash_unit](https://github.com/pgrange/bash_unit), a new and featureful test framework where test cases can be written in pure Bash
- [ShellSpec](https://github.com/shellspec/shellspec), a BDD style testing framework with its own DSL
- [shpec](https://github.com/rylnd/shpec), a BDD style testing framework similar to RSpec, Jasmine, and mocha


## Contribution guide

If you know a testing framework that should be mentioned here or find that there's room for improvement feel free to
open an issue or Pull Request. (See [CONTRIBUTING.md](https://github.com/dodie/testing-in-bash/blob/master/CONTRIBUTING.md).)


## Test drive

To start fiddling with any of the test projects just run the `install.sh` to download and extract the particular
testing framework to a local directory, then execute `test.sh` to start the suite.

- [Bats example project and test drive](example-bats)  
- [shUnit2 example project and test drive](example-shunit2)
- [bash_unit example project and test drive](example-bash_unit)
- [ShellSpec example project and test drive](example-shellspec)
- [shpec example project and test drive](example-shpec)


## Detailed comparision

|                                                               | [Bats](https://github.com/bats-core/bats-core)                                           | [shUnit2](https://github.com/kward/shunit2)                                                                                   | [bash_unit](https://github.com/pgrange/bash_unit)                         | [ShellSpec](https://github.com/shellspec/shellspec)                        | [shpec](https://github.com/rylnd/shpec)                             |
|---------------------------------------------------------------|------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|----------------------------------------------------------------------------|---------------------------------------------------------------------|
| Discover and run all tests<br/>in the project                 | ✔️                                                                                       | ❌ [<sup>?</sup>](example-shunit2#test-discovery)                                                                              | ⚠ [<sup>?</sup>](example-bash_unit#test-discovery)                        | ✔️ [<sup>?</sup>](example-shellspec#test-discovery)                        | ✔️                                                                  |
| Run subset of tests or<br/>a specific test                    | ✔️ [<sup>?</sup>](example-bats#test-discovery)                                           | ⚠ [<sup>?</sup>](example-shunit2#test-discovery)                                                                              | ✔️                                                                        | ✔️                                                                         |  ❌ [<sup>issue</sup>](https://github.com/rylnd/shpec/issues/31)                                                                   |
| Parallel test execution                                       | ✔️                                                                                       | ❌                                                                                                                             | ❌                                                                         | ✔️                                                                         |  ❌                                                                   |
| Skip or ignore tests                                          | ✔️                                                                                       | ⚠ [<sup>?</sup>](example-shunit2#skip-tests)                                                                                  | ✔️ [<sup>?</sup>](example-bash_unit#skip-tests)                           | ✔️                                                                         | ❌ [<sup>issue</sup>](https://github.com/rylnd/shpec/issues/57)                                                                    |
| Rich assertion library                                        | ⚠ [<sup>?</sup>](example-bats#assertions)                                                | ⚠ [<sup>?</sup>](example-shunit2#assertions)                                                                                  | ⚠ [<sup>?</sup>](example-bash_unit#assertions)                            | ✔️ [<sup>?</sup>](example-shellspec#assertions)                            | ✔️ [<sup>?</sup>](example-shpec#assertions)                         |
| Extensible with custom assertions                             | ✔️ [<sup>?</sup>](example-bats#custom-assertions)                                        | ✔️ [<sup>?</sup>](example-shunit2#custom-assertions)                                                                          | ✔️ [<sup>?</sup>](example-bash_unit#custom-assertions)                    | ✔️ [<sup>?</sup>](example-shellspec#custom-assertions)                     | ✔️ [<sup>?</sup>](example-shpec#custom-assertions)                  |
| Before / After                                                | ✔️                                                                                       | ⚠ [<sup>issue</sup>](https://github.com/kward/shunit2/issues/112)                                                             | ✔️                                                                        | ✔️                                                                         |  ❌ [<sup>issue</sup>](https://github.com/rylnd/shpec/issues/52)    |
| BeforeAll / AfterAll                                          | ❌ [<sup>issue</sup>](example-bats#test-discovery)                                        | ⚠ [<sup>issue</sup>](https://github.com/kward/shunit2/issues/112)                                                             | ✔️                                                                        | ✔️ [<sup>?</sup>](example-shellspec#test-format)                           | ❌ [<sup>issue</sup>](https://github.com/rylnd/shpec/issues/52)     |
| Parameterized tests<br/>and test data                         | ❌ [<sup>issue</sup>](https://github.com/sstephenson/bats/issues/136)                     | ❌                                                                                                                             | ❌                                                                         | ✔️                                                                         |  ❌                                                                   |
| Mocking \*                                                    | ✔️ [<sup>?</sup>](example-bats#mocking)                                                  | ⚠ [<sup>?</sup>](example-shunit2#mocking)                                                                                     | ✔️ [<sup>?</sup>](example-bash_unit#mocking)                              | ✔️ [<sup>?</sup>](example-shellspec#mocking)                               | ✔️ [<sup>?</sup>](example-shpec#mocking)                            |
| Isolation between tests \*\*                                  | ✔️ [<sup>doc</sup>](https://github.com/bats-core/bats-core/wiki/Bats-Evaluation-Process) | ❌                                                                                                                             | ✔️                                                                        | ✔️                                                                         |                                                                     |
| Nice local report                                             | ⚠ [<sup>?</sup>](example-bats#report)                                                    | ✔️                                                                                                                            | ✔️                                                                        | ✔️                                                                         | ✔️                                                                    |
| CI compatible report                                          | ✔️ [<sup>TAP</sup>](http://testanything.org/)                                            | ❌ [<sup>issue</sup>](https://github.com/kward/shunit2/issues/31)                                                              | ✔️ [<sup>TAP</sup>](http://testanything.org/)                             | ✔️ [<sup>TAP</sup>](http://testanything.org/)                              |  ❌                                                                   |
| Zero Dependency and<br/>implemented in Bash                   | ✔️                                                                                       | ✔️                                                                                                                            | ✔️                                                                        | ✔️                                                                         | ✔️                                                                  |
| Easy to install \*\*\*                                        | ✔️                                                                                       | ✔️                                                                                                                            | ✔️                                                                        | ✔️                                                                         | ✔️                                                                  |
| Tests written in Bash                                         | ⚠ [<sup>almost</sup>](example-bats#test-format)                                          | ✔️                                                                                                                            | ✔️                                                                        | ❌ [<sup>?</sup>](example-shellspec#test-format)                            | ❌ [<sup>?</sup>](example-shpec#test-format)                         |
| Compatible with the <br/>Unofficial Bash Strict Mode \*\*\*\* | ⚠ [<sup>?</sup>](https://github.com/dodie/testing-in-bash/tree/master/example-bats#unit-testing-scripts-that-set-bash-options)                      | ✔️                                                                                                                            | ⚠ [<sup>issue</sup>](https://github.com/pgrange/bash_unit/issues/61)      | ✔️                                                                         |                                                                     |
| Maintained                                                    | ⚠ [<sup>?</sup>](example-bats#activity)                                                  | ⚠ [<sup>?</sup>](example-shunit2#activity)                                                                                    | ✔️ [<sup>?</sup>](example-bash_unit#activity)                             | ✔️ [<sup>?</sup>](example-shellspec#activity)                              | ⚠ [<sup>?</sup>](example-shpec#activity)                            |
| Mature                                                        | ✔️ [<sup>since 2011</sup>](https://github.com/bats-core/bats-core/releases)              | ✔️ [<sup>since 2007</sup>](https://github.com/kward/shunit2/commits/master?after=0f0a77b6b257f24d2b3ef1b28096fdd154a19f22+10) | ✔️ [<sup>since 2016</sup>](https://github.com/pgrange/bash_unit/releases) | ❌ [<sup>since 2019</sup>](https://github.com/shellspec/shellspec/releases) | ✔️ [<sup>since 2013</sup>](https://github.com/rylnd/shpec/releases) |
| Good documentation                                            | ⚠ [<sup>?</sup>](example-bats#documentation)                                             | ✔️ [<sup>?</sup>](example-shunit2#documentation)                                                                              | ✔️ [<sup>?</sup>](example-bash_unit#documentation)                        | ✔️ [<sup>?</sup>](example-shellspec#documentation)                         | ✔️ [<sup>?</sup>](example-shpec#documentation)                      |

\* **Mocking**:<br/>
The testing framework is compatible with the [common mocking techniques](https://github.com/dodie/testing-in-bash/tree/master/mocking).

\*\* **Isolation between tests**:<br/>
Aliases, custom function definitions, Bash options and variables are not leaking from one test
to another.

\*\*\* **Easy to install**:<br/>
Many of the frameworks support more than one alternatives on how to set it up quickly. It's possible
to install it with your favourite package manager and some of them even have an official Docker image.
Personally, I try to avoid installing project dependencies globally as much as I can,
so I just decided to grab a tar.gz file with the latest release from GitHub.

\*\*\*\* **Compatible with the Unofficial Bash Strict Mode**:<br/>
Sourcing a script file that use the [Unofficial Bash Strict Mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/) should
not break the test framework. Of course, custom assertions and the test code
[should also work with strict mode](https://github.com/dodie/testing-in-bash/tree/master/strictmode) but that's up for the user.
Also, the test framework shouldn't set Bash options as well to ensure that executing sourced functions work similarly to when they are not sourced.


## Related posts, other comparisions

- https://medium.com/wemake-services/testing-bash-applications-85512e7fe2de
- https://stackoverflow.com/questions/1339416/unit-testing-bash-scripts
- https://www.leadingagile.com/2018/10/unit-testing-shell-scriptspart-one/
