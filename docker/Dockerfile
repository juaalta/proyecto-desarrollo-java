
FROM maven:3.6.3-jdk-11 AS builder

WORKDIR /app

COPY mvnw .
COPY mvnw.cmd .
COPY .mvn ./.mvn
COPY pom.xml .
RUN mvn -e -B dependency:resolve

COPY src /app/src
RUN mvn -e -B package



FROM builder as test
#WORKDIR /opt/app
#ADD target/app.jar /opt/app/app.jar
#COPY --from=builder /app/target/project-0.0.1-SNAPSHOT.jar /project-0.0.1-SNAPSHOT.jar

RUN mvn test



# Java 8
# FROM openjdk:8-jre
# Java 11
FROM openjdk:11-jre-slim
#RUN addgroup -S java && adduser -S javauser -G java
RUN addgroup --system java && adduser --system javauser --ingroup java
USER javauser

WORKDIR /opt/app
#ADD target/app.jar /opt/app/app.jar
COPY --from=builder /app/target/app.jar app.jar

VOLUME /tmp

# https://spring.io/guides/topicals/spring-boot-docker/#_tweaks
# Java 8
# ENV JAVA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -noverify -XX:TieredStopAtLevel=1"
# Java 11
ENV JAVA_OPTS="-noverify -XX:TieredStopAtLevel=1"

ENTRYPOINT ["java", ${JAVA_OPTS},  "-Djava.security.egd=file:/dev/./urandom", "-jar", "/opt/app/app.jar"]
