#!/bin/sh
LC_ALL='C'
AA="Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_2 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8H7 Safari/6533.18.5 Quark/2.4.2.986"
rm *.txt
rm -rf md5 tmp
wait
# Create temporary folder
echo '新建TMP文件夹...'
mkdir -p ./tmp/
cd tmp
echo '新建TMP文件夹完成'

# Start Download Filter File
echo '开始下载规则...'
easylist=(
#  "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt" #adgk规则 @坂本大佬
#  "https://raw.githubusercontent.com/banbendalao/ADgk/master/kill-baidu-ad.txt" #百度超级净化 @坂本大佬
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt" #一个URL过滤器
  "https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/mv.txt" #乘风视频广告规则
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt" #大萌主针的盗版网站的规则
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs%20for%20uBo/clear_urls_uboified.txt" #Clean Url 扩展的规则
  "https://raw.githubusercontent.com/hacamer/Adblist/master/adp-pc.txt" #杏梢的全量规则
  "https://raw.githubusercontent.com/Noyllopa/NoAppDownload/master/NoAppDownload.txt" #去APP下载按钮
  "https://easylist.to/easylist/easyprivacy.txt"
#  "https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock.txt"
#  "https://filters.adtidy.org/extension/ublock/filters/2.txt"
)

easylist_plus=(
#"https://raw.githubusercontent.com/xinggsf/Adblock-Plus-Rule/master/rule.txt" #乘风规则
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt" #ubo烦人过滤器
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt" #
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt" #ubo基础过滤器
"https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt" #ubo隐私保护
"https://raw.githubusercontent.com/Cats-Team/AdRule/main/url-filter.txt" #url过滤器 by Hacamer
#"https://raw.githubusercontent.com/uniartisan/adblock_list/master/adblock_privacy.txt"
)

adguard=(
  "https://filters.adtidy.org/android/filters/2_optimized.txt" #adg基础过滤器
  "https://filters.adtidy.org/android/filters/11_optimized.txt" #adg移动设备过滤器
  "https://filters.adtidy.org/android/filters/17_optimized.txt"  #adgURL过滤器
  "https://filters.adtidy.org/android/filters/3_optimized.txt" #adg防跟踪
  "https://filters.adtidy.org/android/filters/224_optimized.txt" #adg中文过滤器
  "https://filters.adtidy.org/android/filters/14_optimized.txt" #adg烦人过滤器
  "https://filters.adtidy.org/android/filters/5_optimized.txt" #adg实验过滤器
  "https://filters.adtidy.org/android/filters/4_optimized.txt" #adg社交过滤器
)

adguard_full=(
  "https://filters.adtidy.org/windows/filters/2.txt" #adg基础过滤器
  "https://filters.adtidy.org/windows/filters/11.txt" #adg移动设备过滤器
  "https://filters.adtidy.org/windows/filters/3.txt" #adg防跟踪
  "https://filters.adtidy.org/windows/filters/224.txt" #adg中文过滤器
  "https://filters.adtidy.org/windows/filters/14.txt" #adg烦人过滤器
  "https://filters.adtidy.org/windows/filters/5.txt" #adg实验过滤器
  "https://filters.adtidy.org/windows/filters/4.txt" #adg社交过滤器
  "https://filters.adtidy.org/windows/filters/17.txt"  #adgURL过滤器
)

allow=(
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/ChineseFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/GermanFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/TurkishFilter/sections/whitelist.txt"
  "https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/SpywareFilter/sections/whitelist.txt"
)

dns=(
  #以下规则不做阐述
  "https://filters.adtidy.org/windows/filters/224.txt" #adg中文过滤器
  "https://easylist.to/easylist/fanboy-annoyance.txt"
  "https://filters.adtidy.org/windows/filters/3.txt"
  "https://filters.adtidy.org/windows/filters/11.txt"
  "https://filters.adtidy.org/windows/filters/2.txt" #adg基础过滤器
#  "https://raw.githubusercontent.com/AdguardTeam/AdGuardSDNSFilter/gh-pages/Filters/filter.txt"
#  "https://abp.oisd.nl/basic/"
  "https://easylist-downloads.adblockplus.org/easylistchina+easylist.txt"
  "https://easylist-downloads.adblockplus.org/easyprivacy.txt"
  "https://easylist.to/easylist/easyprivacy.txt"
  "https://www.fanboy.co.nz/r/fanboy-ultimate.txt"
  "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt"
   "https://raw.githubusercontent.com/durablenapkin/scamblocklist/master/adguard.txt"
   "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
   "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareAdGuardHome.txt"
  "https://raw.githubusercontent.com/hacamer/AdRule/main/dns.txt"
   "https://raw.githubusercontent.com/banbendalao/ADgk/master/ADgk.txt"
)

hosts=(
  "https://adaway.org/hosts.txt"
#  "https://raw.githubusercontent.com/ookangzheng/dbl-oisd-nl/master/hosts_light.txt"
  "https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts"
#  "https://raw.githubusercontent.com/hacamer/Adblist/master/filter/hosts/AdguardDNS.txt"
#  "https://raw.githubusercontent.com/Goooler/1024_hosts/master/hosts"
  "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt"
  "https://raw.githubusercontent.com/StevenBlack/hosts/master/data/someonewhocares.org/hosts"
  "https://raw.githubusercontent.com/hacamer/Adblist/master/filter/hosts/dmz.txt"
  "https://raw.githubusercontent.com/jdlingyu/ad-wars/master/sha_ad_hosts"
#"https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts"
  "https://raw.githubusercontent.com/hacamer/Adblist/master/filter/hosts/rules-hosts.txt"
#  "https://blocklistproject.github.io/Lists/basic.txt"
)

ad_domains=(
  "https://raw.githubusercontent.com/damengzhu/banad/main/jiekouAD.txt"
)

allow_domains=(
  "https://raw.githubusercontent.com/privacy-protection-tools/dead-horse/master/anti-ad-white-list.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
  "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt"
)

dead_hosts=(
  "https://raw.githubusercontent.com/notracking/hosts-blocklists-scripts/master/domains.dead.txt"
  "https://raw.githubusercontent.com/notracking/hosts-blocklists-scripts/master/hostnames.dead.txt"
)

clash=(
   "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanAD.list"
   "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanProgramAD.list"
   "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyList.list"
   "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyListChina.list"
   "https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/BanEasyPrivacy.list"
   "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/AdvertisingLite/AdvertisingLite_Classical.yaml"
   "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Advertising/Advertising_Classical.yaml"
   "https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Privacy/Privacy_Classical.yaml"
)

for i in "${!easylist[@]}" "${!easylist_plus[@]}" "${!adguard_full[@]}" "${!adguard[@]}" "${!adguard_full_ubo[@]}" "${!adguard_ubo[@]}" "${!allow[@]}" "${!hosts[@]}" "${!dns[@]}" "${!ad_domains[@]}"  "${!allow_domains[@]}" "${!dead_hosts[@]}" "${!clash[@]}"
do
  curl --parallel --parallel-immediate -k -L -C - -o "easylist${i}.txt" --connect-timeout 30 -s "${easylist[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "plus-easylist${i}.txt" --connect-timeout 30 -s "${easylist_plus[$i]}"  |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "full-adguard${i}.txt" --connect-timeout 30 -s "${adguard_full[$i]}" |iconv -t utf-8 &
  #curl --parallel --parallel-immediate -k -L -C - -o "ubo-full-adguard${i}.txt" --connect-timeout 60 -s "${adguard_full_ubo[$i]}" &
  curl  --parallel --parallel-immediate -k -L -C - -o "adguard${i}.txt" --connect-timeout 30 -s "${adguard[$i]}" |iconv -t utf-8 &
  #curl --parallel --parallel-immediate -k -L -C - -o "ubo-adguard${i}.txt" --connect-timeout 60 -s "${adguard_ubo[$i]}" &
  curl --parallel --parallel-immediate -k -L -C - -o "allow${i}.txt" --connect-timeout 30 -s "${allow[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "dns${i}.txt" --connect-timeout 30 -s "${dns[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "hosts${i}.txt" --connect-timeout 30 -s "${hosts[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "ad-domains${i}.txt" --connect-timeout 30 -s "${ad_domains[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "allow-domains${i}.txt" --connect-timeout 30 -s "${allow_domains[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "dead-hosts${i}.txt" --connect-timeout 30 -s "${dead_hosts[$i]}" |iconv -t utf-8 &
  curl --parallel --parallel-immediate -k -L -C - -o "clash${i}.txt" --connect-timeout 30 -s "${clash[$i]}" |iconv -t utf-8 &
  # shellcheck disable=SC2181
done
wait

curl --connect-timeout 60 -s -o - https://raw.githubusercontent.com/CipherOps/AdGuardBlocklists/main/REGEX.txt \
 | grep -Fv "/^ad([sxv]?[0-9]*|system)[_.-]([^.[:space:]]+\.){1,}|[_.-]ad([sxv]?[0-9]*|system)[_.-]/" > dns998.txt &
wait
uurl=`curl -s https://raw.githubusercontent.com/neodevpro/neodevhost/master/allowlist`
for url in $uurl ;do
    wget --no-check-certificate -t 1 -T 10 -q -O tmp $url
    cat tmp |grep -v "^#">> tmpallow
    rm -f tmp
done
echo '规则下载完成'

# 添加空格
file="$(ls|sort -u)"
for i in $file; do
  echo -e '\n\n\n' >> $i &
done
wait
# Pre Fix rules
echo '处理规则中...'
cat clash* \
 | grep -v '^#' | grep -F 'DOMAIN-SUFFIX' |sed 's/.*DOMAIN-SUFFIX,//g' |sed "s/^/||/g" |sed "s/$/^/g"> dns9999.txt 

cat clash* \
 | grep -v '^#' |  grep -F 'DOMAIN-KEYWORD' | sed 's/.*DOMAIN-KEYWORD\,//g' |sed "s/^/\//g" > l.txt 

cat hosts*.txt | sort -n| grep -v -E "^((#.*)|(\s*))$" \
 | grep -v -E "^[0-9f\.:]+\s+(ip6\-)|(localhost|local|loopback)$" \
 | grep -Ev "local.*\.local.*$" \
 | sed 's/127.0.0.1/0.0.0.0/g' | sed 's/::/0.0.0.0/g' |grep '0.0.0.0' |grep -Ev '.0.0.0.0 ' | sort \
 |uniq >base-src-hosts.txt &
wait
cat base-src-hosts.txt | grep -Ev '#|\$|@|!|/|\\|\*'\
 | grep -v -E "^((#.*)|(\s*))$" \
 | grep -v -E "^[0-9f\.:]+\s+(ip6\-)|(localhost|loopback)$" \
 | sed 's/127.0.0.1 //g' | sed 's/0.0.0.0 //g' \
 | sed "s/^/||/g" |sed "s/$/&^/g"| sed '/^$/d' \
 | grep -v '^#' \
 | sort -n | uniq | awk '!a[$0]++' \
 | grep -E "^((\|\|)\S+\^)" > abp-hosts.txt & #Hosts规则转ABP规则

cat allow-domains*.txt | sed '/^$/d' | grep -v '#' \
 | sed "s/^/@@||&/g" | sed "s/$/&^/g"  \
 | sort -n | uniq | awk '!a[$0]++' > pre-allow.txt & #将允许域名转换为ABP规则

cat allow-domains0.txt | sed '/^$/d' | grep -v "#" \
 |sed "s/^/@@||&/g" | sed "s/$/&^/g" | sort -n \
 |grep -Fv "yximgs.com" \
 | uniq | awk '!a[$0]++' > pre-allow1.txt & #将允许域名转换为ABP规则

cat allow-domains0.txt | sed '/^$/d' | grep -v "#" \
 |sed "s/^/0.0.0.0 /g" | sort -n \
 | uniq | awk '!a[$0]++' > pre-hostsallow.txt & #将允许域名转换为ABP规则

cat *.txt | sed '/^$/d' \
 |grep -E "^\/[a-z]([a-z]|\.)*\.$" \
 |sort -u >> l.txt &

# Start Merge and Duplicate Removal

echo 开始合并
cat .././mod/rules/adblock-rules.txt easylist*.txt \
 | grep -Ev "^((\!)|(\[)).*" | grep -v 'local.adguard.org' |grep -E -v "^[\.||]+[com]+[\^]$" \
 | sort -n | uniq >> tmp-adblock1.txt  #处理主规则

cat tmp-adblock1.txt .././mod/rules/ex*adblock-rules.txt .././mod/rules/ex*adblock-rules.txt \
 |sort -n |uniq -u >tmp-adblock.txt
rm -f tmp-adblock1.txt
cat .././mod/rules/adblock-rules.txt *easylist*.txt full-adg*.txt \
 |grep -Ev "^((\!)|(\[)).*" | grep -v 'local.adguard.org' \
 | sort -u |grep -v '^ '| sort -n | uniq | awk '!a[$0]++' > tmp-adblock_plus.txt  #处理Plus规则

cat adguard*.txt \
 |grep -Ev "^((\!)|(\[)).*" \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adguard.txt  #处理AdGuard的规则

cat full-adguard*.txt \
 |grep -Ev "^((\!)|(\[)).*" \
 | sort -n | uniq | awk '!a[$0]++' > tmp-adguard-full.txt  #处理AdGuard的Full规则

bash ../script/prepare-dns-upstream.sh
wait
bash ../script/rebuilt-dns-list.sh
wait
#bash ./script/built-dns-list.sh
#wait
<< EOF
cat .././mod/rules/*-rules.txt dns*.txt dns10.txt *easylist*.txt full-adg*.txt abp-hosts*.txt \
 | grep -E "(^\*.*|^-.*|^\/.*|^\..*|^:.*|^[a-z])|([(\@\@)|(\|\|)][^\/\^]+\^)" \
 | grep -Ev "(#|!)" \
 | sort | uniq| awk '!a[$0]++' > ll.txt 
python .././script/rule.py

# | grep -E "^[(\@\@)|(\|\|)][^\/\^]+\^$" \
cat l*.txt pre-allow1.txt dns99* dns10.txt \
 |grep -v '^!' \
 |sort -n |uniq > tmp1-dns1.txt  #处理DNS规则

cp .././script/dns-rules-config.json ./
hostlist-compiler -c dns-rules-config.json -o dns-output.txt 

cat ../mod/*/dns-rule-allow.txt ../mod/*/dns-rule-allow.txt dns-output.txt deadblock.txt deadblock.txt \
 | sort -n |uniq -u >tmp0-dns.txt #去重过期域名

cat tmp0-dns.txt l.txt dns99* \
 | grep -v '^!' |sort -n |uniq >tmp-dns.txt
#wait
cat dns9999.txt| sed 's/||/0.0.0.0 /g' | sed 's/^//g' >hosts9999.txt
cat .././mod/rules/*-rules.txt base-src-hosts.txt hosts99*.txt \
 | sed '/^$/d' |grep -E "^([0-9].*)|^((\|\|)[^\/\^]+\^$)" \
 |sed 's/||/0.0.0.0 /g' | sed 's/\^//g' \
 |sed 's/0.0.0.0 //g'\
 | sort -n | uniq > tmp1-domain.txt  #处理Hosts规则

cat ../mod/*/dns-rule-allow.txt ../mod/*/dns-rule-allow.txt tmp1-domain.txt tmpallow tmpallow pre-hostsallow.txt pre-hostsallow.txt deadhosts.txt deadhosts.txt\
 | sed 's/||//g' |sed 's/\^//g' \
 | sort -n |uniq -u >tmp-ad-domains.txt #去重允许域名

cat tmp-ad-domains.txt \
 | sed 's/^/0.0.0.0 /g' \
 | sort -n | uniq > tmp-hosts.txt #处理广告域名
EOF
cd ../tmp/
mv ../{dns.txt,hosts.txt,ad-domains.txt} ./
rename 's/^/tmp-/' dns.txt hosts.txt ad-domains.txt
sed -i 's/^\!.*//g' tmp-dns.txt tmp-hosts.txt tmp-ad-domains.txt
sed -i 's/^\#.*//g' tmp-dns.txt tmp-hosts.txt tmp-ad-domains.txt
sed -i '/^$/d' tmp-dns.txt tmp-hosts.txt tmp-ad-domains.txt
rm -f ../{dns.txt,hosts.txt,ad-domains.txt}
cat .././mod/rules/* *.txt | grep '^@' \
 | sort -n | uniq > tmp-allow.txt 


echo 规则合并完成
# Move to Pre Filter
echo '移动规则到Pre目录'
cd ../
mkdir -p ./pre/
cp ./tmp/tmp-*.txt ./pre
cd ./pre
echo '移动完成'

# Python 处理重复规则
#python .././script/rule.py

# Start Add title and date
diffFile="$(ls|sort -u)"
for i in $diffFile; do
 python .././script/rule.py $i
 n=`cat $i | wc -l` 
 echo "! Version: $(TZ=UTC-8 date +'%Y-%m-%d %H:%M:%S')(GMT+8) " >> tpdate.txt 
 new=$(echo "$i" |sed 's/tmp-//g') 
 echo "! Total count: $n" > $i-tpdate.txt 
 cat ./tpdate.txt ./$i-tpdate.txt ./$i |grep -Ev "^(\|)*(\.)?com(\^)?$" > ./$new 
 rm $i *tpdate.txt 
done

echo '规则添加统计数据完成'
# Add Title and MD5
cd ../
mkdir -p ./md5/
diffFile="$(ls pre |sort -u)"
for i in $diffFile; do
 titleName=$(echo "$i" |sed 's#.txt#-title.txt#') 
 cat ./mod/title/$titleName ./pre/$i | awk '!a[$0]++'> ./$i 
 sed -i '/^$/d' $i 
 md5sum $i | sed "s/$i//" > ./md5/$i.md5 
 perl ./script/addchecksum.pl ./$i &
 iconv -t UTF-8 $i > tmp-$i
 mv -f tmp-$i $i
 #echo "合并${i}的标题中"
done
wait
echo '规则处理完成'

sed -i 's/!/#/g' hosts.txt
rm -rf pre tmp
exit
