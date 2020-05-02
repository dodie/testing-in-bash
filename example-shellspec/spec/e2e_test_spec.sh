Describe 'ice_cream_price.sh'

  It 'should display 100 for the price of a portion for low quantities'
    When call src/ice_cream_price.sh 1
    The status should be success
    The output should equal 'Total 100'
  End

  It 'should give 20% discount for large quantities on odd days'
    # Mocking date by adding a custom executable to the PATH
    export DATE_MOCK_REPLY="1"
    export PATH=spec/mocks:$PATH

    When call src/ice_cream_price.sh 4
    The status should be success
    The output should equal 'Total 320'
  End

  It 'should give no discount even for large quantities on even days'
    # Mocking date by adding a custom executable to the PATH
    export DATE_MOCK_REPLY="2"
    export PATH=spec/mocks:$PATH

    When call src/ice_cream_price.sh 4
    The status should be success
    The output should equal 'Total 400'
  End
End

