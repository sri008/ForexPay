# To get the latest Jar file from nexus
# URL used to extract the nexus repository details
# http://3.7.214.202:8081/nexus/service/local/repositories/releases/content/com/squad/ForexPay/maven-metadata.xml
#To pull group id

GROUPID=$(curl -s "http://3.7.214.202:8081/nexus/service/local/repositories/releases/content/com/squad/ForexPay/maven-metadata.xml" | grep "<groupId>.*</groupId>" | sed 's/  <groupId>//g'| sed 's/<\/groupId>//g' | sed 's/\./\//g')
#To pull artifactID

ARTICATID=$(curl -s "http://3.7.214.202:8081/nexus/service/local/repositories/releases/content/com/squad/ForexPay/maven-metadata.xml" | grep "<artifactId>.*</artifactId>" | sed 's/  <artifactId>//g'| sed 's/<\/artifactId>//g')
#To pull latest VersionID

VERSION=$(curl -s "http://3.7.214.202:8081/nexus/service/local/repositories/releases/content/com/squad/ForexPay/maven-metadata.xml" | grep "<version>.*</version>" | sort --version-sort | uniq | tail -n1 | sed -e "s#\(.*\)\(<version>\)\(.*\)\(</version>\)\(.*\)#\3#g")
# URL
URL=http://3.7.214.202:8081/nexus/service/local/repositories/releases/content/

# pull latest
wget $URL$GROUPID/$ARTICATID/$VERSION/$ARTICATID-$VERSION.jar
