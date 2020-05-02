# shUnit2 test drive

shUnit2 is the great-grandmother of all bash test frameworks. I really like that the test files are plain old Bash files,
and that it has lot's of assertions by default. However, regarding other features it seems to be lagging behind it's competitors.

If you are after a "pure Bash" testing framework, make sure to also check [bash_unit](https://github.com/dodie/testing-in-bash/blob/master/example-bash_unit/).


## Test format

✔️ Test files are simple Bash scripts that one can execute. Functions are picked up by the test framework based on
a naming convention, and overall the look and feel of a test file is very similar to JUnit.

⚠️ What I personally don't like is that the end of each test file shunit2 has to be sourced to do it's thing.
This forces you to either put its executable to the PATH or some environment variable, or hardcode its path into
each of the tests.

```bash
testEquality() {
  assertEquals 1 1
}

. ./shunit2
```


## Test Discovery

⚠️ Because the framework is invoked from each individual test file, it also means that there's no such thing as test
discovery in shunit2. If you'd like to run your whole test suite, constituting multiple test files at once, you have
to create some sort of custom launch mechanism that discovers and starts the test files.

It's easy to get up and running with a [simple wrapper](https://github.com/dodie/testing-in-bash/blob/master/example-shunit2/test.sh),
but things can easily get more complicated if you'd like to support proper test file discovery including subdirectories, partial execution, and executing all test files regardless of failures but still emit appropriate status code to indicate failures.

Related: [kward/shunit/issues/52](https://github.com/kward/shunit2/issues/52)

It has the concept of a test suite, but only in a single file. It can
[take test function names as an argument](https://github.com/kward/shunit2#-running-specific-tests-from-the-command-line)
to focus on some dedicated tests and only execute those. It does not support wildcard matching. 


## Assertions

✔️ Among the frameworks I've checked, shUnit2 has the most assertions available by default:

- `assertEquals`
- `assertNotEquals`
- `assertContains`
- `assertNotContains`
- `assertNull`
- `assertNotNull`
- `assertTrue`
- `assertFalse`

(In fact, there might be a bit too many of them, some providing similar functionalities like `assertEquals` and `assertSame`.)

✔️ They can also take optional messages that will be displayed upon failures, which is quite nice.

⚠️ One problem I found with these assertions is that by default they don't report the line number where the failure happened.
To include line numbers, the framework provide [macros](https://github.com/kward/shunit2#-including-line-numbers-in-asserts-macros)
instead of these assertions:

```bash
${_ASSERT_EQUALS_} '"not equal"' 2 2
```

Using macros involve quite some line noise, and it's also a bit problematic that with this test files might become mixed,
using both assertion functions and macros for the same reason.


## Custom assertions

✔️ It’s possible to [create new assertions](https://github.com/kward/shunit2/wiki/Cookbook) by building functions on top of
the existing assertions, although there's no dedicated no dedicated lower-level API to support it.
Custom assertions can be sourced from an external file.


## Skip tests

✔️ shUnit2 has an unique approach to skipping tests: instead of skipping whole test cases,
here it's possible to skip certain assertions:

```bash
assertEquals 1 1 # This assertion will run
startSkipping
assertEquals 1 1 # This assertion will be skipped
endSkipping
assertEquals 1 1 # This assertion will also run
```

If the test starts with `startsSkipping`, and there are no `stopSkipping` the whole test will be skipped.

This can be handy to temporarily disable some faulty assertions in a test.

⚠️ From a reporting point of view however, things are a bit lacking compared to other frameworks.
Skipping can't take an optional argument, so it's not easy to tell why it's skipped. Also, in the report
there's no distinction between passed and skipped tests, the report will only mention the number of
skipped assertions at the end.

```bash
testEquality1
testEquality2

Ran 2 tests.

OK (skipped=1)

# Which one was skipped? :(
```


## Mocking

⚠️ From the [three common techniques](https://github.com/dodie/testing-in-bash/tree/master/mocking), mocking is only working
by using aliases or PATH override, but [not with function exports](https://github.com/dodie/testing-in-bash/blob/master/example-shunit2/test/unit_test.sh#L25-L38). This is a bit unfortunate since this technique seems to be the most versatile.


## Activity

⚠️ The project is around since 2007. Between 2011 and 2018 there were no releases, but the project seems to be awakening since then.
accept PRs again since 2018. There's a huge number of old open issues and PRs.


## Documentation

✔️ The [example tests](https://github.com/kward/shunit2/tree/master/examples) make it very clear how to use the framework,
and the project's [readme](https://github.com/kward/shunit2/) does not leave out a single feature.
