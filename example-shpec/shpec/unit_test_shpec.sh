#!/usr/bin/env bash
. ./src/ice_cream_price.sh

describe "ice_cream_price.sh (unit)"
  it "should display 100 for the price of a portion for low quantities"
    assert equal "$(main 1)" "Total 100"
  end

  it "should not fail calculating"
    main 1 >/dev/null
    assert equal $? 0
  end

  it 'should give 20% discount for large quantities on odd days'
    stub_command getDay "echo 1"
    assert equal "$(main 5)" "Total 400"
  end
  
  it 'should give no discount even for large quantities on even days'
    stub_command getDay "echo 2"
   assert equal "$(main 5)" "Total 500"
  end
end
