rm -r ./target
mvn package

export LS_ACCESS_TOKEN=6how6J0/2q4Dqxo6VYi6CKXwQJARSmcvydZYNIpti97UAsyjiCbH1aKTp3VoealzQouMtY0FA0xuwvDQhYJFU87fXMngEWngSxDKCSsI

java -javaagent:lightstep-opentelemetry-javaagent-0.7.1.jar \
     -Dls.service.name="Level Three" \
     -jar ./target/level-three-0.0.1-SNAPSHOT.jar