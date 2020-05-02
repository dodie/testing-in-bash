Describe 'assertion showcase'

  # skip

  It 'should display 100 for the price of a portion for low quantities'
    Skip 'this test is broken'
    When call src/ice_cream_price.sh 1
    The output should equal 'Total 101'
  End

  It 'should display 100 for the price of a portion for low quantities'
    When call src/ice_cream_price.sh 1
    The output should equal 'Total 100'
  End

  It 'should display "total"'
    When call src/ice_cream_price.sh 1
    The output should start with 'Total'
  End

  # TODO custom assertion lang

End
