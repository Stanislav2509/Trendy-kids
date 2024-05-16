## Build stage#
FROM maven:3.9.6-eclipse-temurin-21 AS builder
RUN mkdir /build
COPY . /build
WORKDIR /build
RUN mvn clean package -DskipTests
## Package stage#
FROM eclipse-temurin:21-jdk
RUN mkdir /app
COPY --from=builder /build/target/Modern-kids-0.0.1-SNAPSHOT.jar /app/service.jar
WORKDIR /app
CMD ["java","-jar","service.jar"]
