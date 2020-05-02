Describe 'assertion showcase'

  # Example for Skip
  It 'should display 100 for the price of a portion for low quantities'
    Skip 'this test is broken'
    When call src/ice_cream_price.sh 1
    The output should equal 'Total 101'
  End

  # Example for a simple 'equals' assertion
  It 'should display 100 for the price of a portion for low quantities'
    When call src/ice_cream_price.sh 1
    The output should equal 'Total 100'
  End

  # Example for a different assertion
  It 'should display "total"'
    When call src/ice_cream_price.sh 1
    The output should start with 'Total'
  End

  # Example for a custom assertion
  It 'should use my custom assertion'
    When call src/ice_cream_price.sh 1
    The output should regexp '.*Total.*'
  End
End
