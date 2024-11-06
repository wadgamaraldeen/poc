#!/bash/bin

for d in $(cat target.txt); do

waymore -i $d -mode U -oU w.txt;

done

cat w.txt | grep "=" > urls.txt

cat urls.txt | httpx -silent -o p.txt

cat p.txt | uro > params.txt

################################

cat w.txt | grep ".js$" | httpx -mc 200 | sort -u | tee js-files.txt

rm -r w.txt
rm -r urls.txt
rm -r p.txt
