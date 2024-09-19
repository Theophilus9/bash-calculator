#!/bin/bash

#addition function
add() {
    echo "scale=4; $first_number+$second_number" | bc 
}

#subtraction function
sub(){
    echo "scale=4; $first_number - $second_number" | bc
}

#multiplication function
mul(){
    echo "scale=4; $first_number * $second_number" | bc
}

#division funciton
div(){
    if [ $2 == 0 ]; then
        echo "Cant divide by zero"
    fi
    echo "scale=4; $first_number / $second_number" | bc
}


while [ 0 == 0 ]; do
read -p "Enter a number to perfomr any operation; 1=Addition 2=Subtraction 3=Multiplication 4=Division 5=exit " operation

if ! [[ "$operation" =~ ^-?[0-9]+$ ]]; then
  echo "Invalid choice. Please enter an integer from 1 to 5."
  exit 0
elif [[ $operation -lt 1 ]] || [[ $operation -gt 5 ]]; then
  echo "Invalid choice. Please enter a number between 1 and 5."
  exit 0
else
  echo "You selected operation $operation."
fi

read -p "Enter first number: " first_number
read -p "Enter second number: " second_number

case $operation in
    1) result=$(add $first_number $second_number) sign="+";;
    2) result=$(sub $first_number $second_number) sign="-";;
    3) result=$(mul $first_number $second_number) sign="x";;
    4) result=$(div $first_number $second_number 2>/dev/null) sign="/";;
    *) result="" 
esac

if [ "$result" != "" ]; then
    echo "$first_number $sign $second_number = $result"
fi
done