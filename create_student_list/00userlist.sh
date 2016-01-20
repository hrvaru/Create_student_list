clear
chmod +x $0
#truncate -s 0 temp
echo "\n\t#############################################################################################################################################"
echo "\n\t\t                                                     sub_userlist"
echo "\n\t#############################################################################################################################################"
echo "\n"
  read -p "        Enter filename to search into : " file

origin=`cat $file|wc -l`
echo "\n\tFilename : $file \tNo. of lines in file : $origin"
sleep 2

echo "\n"
  read -p "        How many subjects are there : " sub
b=$sub  

echo "\n"
while [ $b -gt 0 ];
do
  read -p "        Enter content to search for : " search

  grep -w $search "$file" >> users_$search\.csv
  b=`expr $b - 1`
   
done


ls *.csv|head --lines=-1  > tmp0
res=0

while read l
do
  a=`cat $l|wc -l`
  echo "\n\tFilename : `echo $l`  Numbers of lines in file : `echo $a` "
  res=`expr $res + $a`
done < tmp0

if [ $res -eq $origin ]; then
   echo "\n\tLines addition of all .csv files equivalent to original file. " 
else 
   echo "\n\tSomething went wronge."
fi

rm -rf tmp0
