#!/bin/bash

function main() {
    numberOfPortions=$1
    pricePerPortion=$(calculatePrice $numberOfPortions)
    totalPrice=$(( $numberOfPortions * $pricePerPortion ))

    echo "Total $totalPrice"
}

function calculatePrice() {
    if [[ $numberOfPortions -lt 3 ]]; then
        echo "100"
    else
        day=$(getDay)
        if (( $day % 2 )); then
            echo "80"
        else
            echo "100"
        fi
    fi
}

function getDay() {
    date '+%d'
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
  main $@
fi
