#!/bin/bash -x
read -p "Enter the first number" a;
read -p "Enter the second number" b;
read -p "Enter the third number" c;

declare -A operationResults;
declare operationValues;
count=0;

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
	operationValues[$count]="${operationResults[$key]}";
	count=$(($count+1));
done

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

echo "${operationValues[@]}";
