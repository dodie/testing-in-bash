# ShellSpec test drive

## Test format

bash with a lots of custom syntax to support BDD style
✓ to my surprise most bashy things keep working, so the syntax does not feel like a limitation
✓ / ⚠️If you can get used to a totally new language, writing tests is pretty efficient and fun


✓ support for before after
✓/⚠️ no explicit support for beforeall afterall in the DSL, but it can be done with simple bash functions
⚠️ Problem: you can’t really use the DSL in the before/after hooks, so if you wish to do some assertions, you are on your own, and have to resort to custom bash stuff


## Test Discovery

considers all files as tests that are in the spec folder and their name contains spec
subset of tests can be run with filters, or it’s even possible to focus on a single test

It expects a specific structure, and comes with an initializer to generate that
which is really convenient, because it provides structure that you have to follow


## Assertions

✓nice error output with all the details needed
✓many custom assertions in a custom language
statements can be combined, which is quite fancy
✓ Although it’s a bit confusing at first what assertions are available, the tool helps with interactive help when it encounters something invalid expressed with its DSL

```bash
# This happened when I wrote
#”The output should contain 'Total'”

Unknown word 'contain' after should verb. The correct word is one of the following.
            
     be, end, equal, eq, has, include, match, start, satisfy
            
# Then, when I changed contain to start
#”The output should contain 'Total'”


Unknown word 'Total' after start matcher. The correct word is one of the following.
            
     with


# Which ultimately led me to
#”The output should start with 'Total'”         
# Which does what I expected.

```


## Custom assertions

✓ the DSL is extensible
⚠️ but it has increased learning curve compared to just doing it in bash
✓ also anything bash can be added, so with that, it’s also extensible
⚠️ however it might have the downside that the basy code has to interface with the DSL, which might be not so convenient, and the test code will be a mix of DSL and bash


## Skip tests

TODO


## Mocking

Mocking is possible with all [three common techniques](https://github.com/dodie/testing-in-bash/tree/master/mocking):

- alias
- function export
- PATH override


## Activity

⚠️ since 2019
Bit new and unpolished, some features are added/removed e.g. beforeAll
https://github.com/shellspec/shellspec/issues/7
✓ has many releases, including a recent ones
⚠️ overall much less popular than bats or shunit2, has less activity issue/pr-wise,
✓ but much less forgotten issues


## Documentation

✓ many examples: https://github.com/shellspec/shellspec/tree/master/sample/spec
✓ interactive help for DSL
