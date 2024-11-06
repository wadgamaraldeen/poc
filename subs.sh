#!/bash/bin

for url in $(cat domains.txt); do


subfinder -d $url -all >> subfinder.txt;

amass enum -passive -norecursive -noalts -d $url >> amass.txt;

echo $url | assetfinder --subs-only >> asset.txt;

sublist3r -d $url >> lis.txt

done


 cat subfinder.txt amass.txt asset.txt lis.txt | anew all-subs.txt

 rm -r subfinder.txt amass.txt asset.txt lis.txt

 cat all-subs.txt | httpx -o live-subs.txt

 rm -r all-subs.txt
