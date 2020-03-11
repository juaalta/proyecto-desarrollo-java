# Java 8
# FROM openjdk:8-jre
# Java 11
FROM openjdk:11-jre

WORKDIR /opt/app
ADD target/app.jar /opt/app/app.jar

VOLUME /tmp
USER 1000

# https://spring.io/guides/topicals/spring-boot-docker/#_tweaks
# Java 8
# ENV JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -noverify -XX:TieredStopAtLevel=1"
# Java 11
ENV JAVA_OPTS="-noverify -XX:TieredStopAtLevel=1"

ENTRYPOINT ["java", "-jar", "/opt/app/app.jar"]
