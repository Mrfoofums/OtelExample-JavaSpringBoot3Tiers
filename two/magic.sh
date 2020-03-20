java -Dsa.tracer=lightstep \
-Dls.collectorHost=`localhost` \
-Dls.collectorProtocol=http \
-Dls.collectorPort=1980 \
-Dls.accessToken=XyE9AymrZ8GqaiPl6fGD2d3eRi5YnID52Y6aLGFHLb+2K3ZUPBjJjyhAWsH0/TBLnThw7hwHpa8Mh/AEOW79j6G5nznKdGVwoCHJcnl4 \
-Dls.componentName=`Level 2` \
-javaagent:/PATH/TO/YOUR/opentracing-specialagent-1.5.8.jar \
-jar level-two-1.jar