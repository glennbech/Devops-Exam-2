#stage 1: bygge

FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

#stage2: kjøre
FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app/app.jar
CMD ["java", "-jar", "app.jar"]