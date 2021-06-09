#!/bin/bash -x
read -p "Enter the first number" a;
read -p "Enter the second number" b;
read -p "Enter the third number" c;

declare -A operationResults;
declare operationValues;
i=0;

result_1=$(($a+$b*$c));
result_2=$(($a*$b+$c));
result_3=$(($c+$a/$b));
result_4=$(($a%$b+$c));

operationResults[1]=$result_1;
operationResults[2]=$result_2;
operationResults[3]=$result_3;
operationResults[4]=$result_4;

for key in "${!operationResults[@]}"
do
	operationValues[$i]="${operationResults[$key]}";
	i=$(($i+1));
done
echo "${operationValues[@]}";
