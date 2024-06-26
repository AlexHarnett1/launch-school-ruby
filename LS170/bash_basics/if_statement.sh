int1=5
int2=6

if [[ $int1 -eq $int2 ]]
then
echo "Yo yo yo"
else
echo "No no no"
fi

if [[ -e ./if_statement.sh ]]
then
  echo 'File exists'
fi