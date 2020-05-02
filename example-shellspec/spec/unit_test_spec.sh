Describe 'ice_cream_price.sh'
  Include src/ice_cream_price.sh

  It 'should display 100 for the price of a portion for low quantities'
    When call main 1
    The output should equal 'Total 100'
  End

  It 'should give 20% discount for large quantities on odd days'
    # Mocking a function by defining an alias
    shopt -s expand_aliases
    alias "getDay"="echo '1'"

    When call main 4
    The output should equal 'Total 320'
  End

  It 'should give no discount even for large quantities on even days'
    # Mocking a function by exporting a function
    function getDay() { echo "2"; }
    export -f getDay

    When call main 4
    The output should equal 'Total 400'
  End
End

