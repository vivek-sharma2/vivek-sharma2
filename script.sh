for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done
echo "Provided Mount Point is: $mountPoint"
addressLine=$(sudo lsblk | grep "$mountPoint")
echo "$addressLine"
IFS=" "
read -ra arr <<< "$addressLine"
deviceAddress=${arr[0]}
deviceAddress="/dev/$deviceAddress"
echo "Current Device is: $deviceAddress"
sudo resize2fs "$deviceAddress"
#https://drive.google.com/u/0/uc?id=1LB0DaOcRS3cWRKVH8eyS33FoknG0qfPC&export=download