# Additional notes for the comparision

## Test Discovery

- By default it runs all test files in the given directory, or just a given file.
- It can also consider subdirectories with the `--recursive flag`
- With `--filter` one can specify a regex, and only tests with a matching name will be executed.


## Assertions

It provides no assertions by default. Instead, simply if a command exits with a non-zero code, the test will fail:

```
TODO
```

All the examples promote this approach. In my opinion, it has two serious problems:

- one have to be fluent in [Bash conditionals](https://tldp.org/LDP/abs/html/comparison-ops.html)
  in order to work with it
- the report lacks important information, like the expected and actual values


```bash
@test "addition using bc" {
	  result="$(echo 3)"
	    [ "$result" -eq 4 ]
}


✗ addition using bc
   (in test file test/test2.bats, line 8)
        `[ "$result" -eq 4 ]' failed

# what was the $result? :(
```


It has 
It has an extension called [bats-assert](https://github.com/bats-core/bats-assert) that provide assertions
like equals or partial matching on the output. They provide nice error messages too:

```bash
load '../lib/bats-support/load'
load '../lib/bats-assert/load'

@test "using asserts" {
  run src/ice_cream_price.sh 4
  assert_success
  assert_output -p "Total 500"
}

 ✗ using asserts
   (from function `assert_output' in file test/../lib/bats-assert/src/assert_output.bash, line 186,
    in test file test/asserts.bats, line 7)
     `assert_output -p "Total 500"' failed

   -- output does not contain substring --
   substring : Total 500
   output    : Total 400
   --
```


Most of the asserts provided by `bats-assert` are working directly with the return code or the output
of the command executed with run. There are not too many general assertions besides `assert_equal`.

## Custom assertions

It's not just possible to create custom assertions, but there are some dedicated constructs in the framework
to support creating them:

- With `load` shared test code (e.g. assertion functions) can be imported ([doc](https://github.com/bats-core/bats-core#load-share-common-code))
- The [bats-support](https://github.com/bats-core/bats-support) library provides common functions for error reporting and output formatting.

## Report

Report for test cases are not separated by test files. This is not a problem for small projects,
but with many test files it's a bit harder to relate a failing test to the test file where it's
defined:

```
 ✓ this is the first test from the first test suite
 ✓ this is the second test from the first test suite
 ✓ this is the first test from the second test suite
 ✓ this is the second test from the second test suite
```

## Mocking

Mocking is possible with all [three common techniques](https://github.com/dodie/testing-in-bash/tree/master/mocking):

- alias
- function export
- PATH override


## Test format

Test files are "almost Bash".


BATS only considers files with the `.bats` extension. This is not a huge problem, but the editor has to be adapted
a bit to offer syntax highlight and the usual features for these files.

Also, tests are marked with a special `@test` annotation, which is not Bash syntax. It's is picked up by BATS which
translates it into a test wrapper. Although it's special syntax, it makes really clean how tests can be defined:

```bash
@test "ice cream price should be 100 per portion for low quantities" {
  run src/ice_cream_price.sh 1
  assert_success
  assert_output -p "Total 100"
}
```

As can be seen in this example, it also offers a special `run` construct to run the script under test and capture the results.

Finally, although it's optional, BATS test files can have their own shebang line as well: `#!/usr/bin/env bats`.


## Activity

According to the project’s GitHub repository it's been around since 2011. The [original repository](https://github.com/sstephenson/bats)
was discontinued in 2016, but it was forked to the [bats-core organization](https://github.com/bats-core) to ensure the project's
maintenance and collect useful thirdparty libraries. Despite this transition, there's a huge number of old open issues and PRs.


## Documentation

The bats-core project has good documentation, and seems to be up to date, but the thirdparty libraries, including bats-assert
seems to lag behind. In many cases they link to old repos from before the transition to the bats-core organization, and documents that
ere not updated in the last couple of years. For example the documentation recommended installing bats-assert and its dependency
into the test folder, but that [did not work](https://github.com/bats-core/bats-core/issues/273) because BATS considered thesir files
as test cases and tried to execute them.

