#!/bin/bash -x

#reading the input from the user

read -p "Enter the first number" a;
read -p "Enter the second number" b;
read -p "Enter the third number" c;

#declaring the dictionary and an array for storing the values

declare -A operationResults;
declare operationValues;
count=0;

#arithmetic operation and storing the results

result_1=$(($a+$b*$c));
result_2=$(($a*$b+$c));
result_3=$(($c+$a/$b));
result_4=$(($a%$b+$c));

#storing the results from the above formula in the form of key:value pairs

operationResults[1]=$result_1;
operationResults[2]=$result_2;
operationResults[3]=$result_3;
operationResults[4]=$result_4;

#separating the values from the dictionary and storing it in an array

for key in "${!operationResults[@]}"
do
	operationValues[$count]="${operationResults[$key]}";
	count=$(($count+1));
done

#sorting the array in descending order

n=4;
for ((i=0; i<$(($n-1)); i++))
do
	for ((j=0; j<$(($n-1)); j++))
	do
		if [ "${operationValues[j]}" -lt "${operationValues[$(($j+1))]}" ];
		then
			temp=${operationValues[j]};
			operationValues[j]=${operationValues[$(($j+1))]};
			operationValues[$((j+1))]=$temp;
		fi
	done
done

echo "Values in descending order-->${operationValues[@]}";

#sorting the array in ascending order

for ((i=0; i<$(($n-1)); i++))
do
	for ((j=0; j<$(($n-1)); j++))
	do
		if [ "${operationValues[j]}" -gt "${operationValues[$(($j+1))]}" ];
		then
			temp=${operationValues[j]};
			operationValues[j]=${operationValues[$(($j+1))]};
			operationValues[$((j+1))]=$temp;
		fi
	done
done

echo "Values in ascending order-->${operationValues[@]}";
