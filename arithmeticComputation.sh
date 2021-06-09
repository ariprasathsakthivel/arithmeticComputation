#!/bin/bash -x
read -p "Enter the first number" a;
read -p "Enter the second number" b;
read -p "Enter the third number" c;
result_1=$(($a+$b*$c));
result_2=$(($a*$b+$c));

