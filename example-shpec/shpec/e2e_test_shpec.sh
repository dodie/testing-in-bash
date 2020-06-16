#!/usr/bin/env bash
export DATE_MOCK_REPLY
PATH="$PWD/shpec/mocks:$PATH"
DATE_MOCK_REPLY=1

describe "ice_cream_price.sh (e2e)"
  it "should display 100 for the price of a portion for low quantities"
    assert equal "$(src/ice_cream_price.sh 1)" "Total 100"
  end

  it "should not fail calculating"
    src/ice_cream_price.sh 1 >/dev/null
    assert equal $? 0
  end

  it 'should give 20% discount for large quantities on odd days'
    DATE_MOCK_REPLY=1
    assert equal "$(src/ice_cream_price.sh 5)" "Total 400"
  end
  it 'should give no discount even for large quantities on even days'
    DATE_MOCK_REPLY=2
    assert equal "$(src/ice_cream_price.sh 5)" "Total 500"
  end
end
