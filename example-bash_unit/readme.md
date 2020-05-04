# bash_unit test drive

This framework allows to write test files in pure Bash, without custom syntax, yet provide concise syntax and many features.
My only concern is that it has only a few built-in assertions, but that can be solved by writing custom ones.


## Test format

✔️ Test files are simple shell scripts, executed by the test framework. There's no need for any extra noise besides the test
functions in a test file: no custom shebang line, no framework initialization code, and no custom imports.

```bash
test_example(){
  assert_equals "hello" "world"
}
```

✔️ Test functions are simple bash functions without custom syntax. All functions which name is starting with `test_`
is considered a test function


## Test Discovery

✔️ bash_unit is parameterized with the list of test files to be executed. This means that it's trivial to focus on a single
test file to execute. Moreover, it can also take a pattern to narrow test cases to be executed to the matching ones.

⚠️ Because it explicitly has to be parameterized with the list of test files, it can't discover directories. For this purpose
one might wish to introduce a [lightweight wrapper](https://github.com/dodie/testing-in-bash/blob/master/example-bash_unit/test.sh).


## Assertions

⚠️ It has some assertions available like `assert_equals` but lacks other essential ones, like `assert_contains`.

✔️ All assertions provide a nice, easy to read report including the context and line number.


## Custom assertions

✔️ It’s possible to create new assertions by building functions on top of the existing assertions, although there's no dedicated no dedicated lower-level API to support it. Custom assertions can be sourced from an external file.


## Skip tests

✔️ If a test function name is starting with `pending` or `todo` it will be skipped which will be properly reflected in the report.


## Mocking

✔️ Supports all [common techniques](https://github.com/dodie/testing-in-bash/tree/master/mocking) for mocking.

✔️ Additionally, it even has the
[built-in `fake` command](https://github.com/pgrange/bash_unit/blob/a10751626ef0caa2bc5988a574e9a546426a2791/bash_unit#L123-L133)
which is a shorthand for the function-export based mock technique,
making the tests even more clear and concise.


## Activity

✔️ The project is around since 2016 and has regular releases. Overall much less popular than Bats or shUnit2, and has activity
on the GitHub repository, but there's also much less forgotten issues and PRs.


## Documentation

✔️ Based on the [getting started guide](https://github.com/pgrange/bash_unit) it was really easy to get started.
