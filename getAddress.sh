address=$*
address=${address// /+}
echo $address
http="http://maps.googleapis.com/maps/api/geocode/json?address=$address&sensor=true"
echo $http
curl --silent "$http" > latlong.txt
#cat latlong.txt
address=`less latlong.txt |grep formatted |cut -d ":" -f2 |tr -d '"'`
lat1=`less latlong.txt |grep '"lat"' |cut -d ":" -f2 |tr -d " "`
lng1=`less latlong.txt |grep '"lng"' |cut -d ":" -f2 |tr -d " "`
lat=($lat1)
lng=($lng1)
echo $address 
echo "lat:${lat[0]}"
echo "long:${long[0]}"
rm latlong.txt
