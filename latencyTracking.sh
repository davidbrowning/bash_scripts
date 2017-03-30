mv activeips.csv activeips.archive
mv stats.txt stats.archive
printf "This test was last run on $(date) \n" >> activeips.csv
printf "This test was last run on $(date) \n" >> stats.txt
for i in $(seq 1 255); do 
result=$(ping -c 2 192.168.0.$i) 
strip=$(echo $result | grep -e [0-9]\ received -o)
num=${strip:0:1}
if [ $num != 0 ]; then 
printf "testing 192.168.2.$i \n"
printf "192.168.2.$i," >> activeips.txt
mtr -r -c 10 192.168.2.$i >> stats.txt
else
printf "no reply from 192.168.2.$i \n"
fi;
done
