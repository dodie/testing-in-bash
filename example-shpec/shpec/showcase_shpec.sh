#!/usr/bin/env bash
describe 'assertion showcase'

 # Example for a simple 'equals' assertion
 it 'should display 100 for the price of a portion for low quantities'
   assert equal "$(src/ice_cream_price.sh 1)" 'Total 100'
 end

 # Example for a different assertion
 it 'should display "Total"'
   assert glob "$(src/ice_cream_price.sh 1)" 'Total*'
 end

 # Example for a custom assertion
 it 'should use my custom assertion'
   assert ice_price "$(src/ice_cream_price.sh 1)" 100
 end
end
