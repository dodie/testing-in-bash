#!/usr/bin/env bash
ice_price(){
    actual="$1"
    expected_num="$2"
    assert equal "$actual" "Total $expected_num"
}