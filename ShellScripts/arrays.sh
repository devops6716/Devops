#!/in/bash 

#creating an array

Fruits=("Apple" "Banana" "Mango")

# Displaying array values by position
echo " First value is ${Fruits[0]}"
echo " second value is ${Fruits[1]}"
echo " third value is ${Fruits[2]}"

# Displaying all the values of the array
echo " ${Fruits[@]}"
