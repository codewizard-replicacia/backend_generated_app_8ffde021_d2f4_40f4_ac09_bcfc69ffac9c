FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app
COPY pom.xml pom.xml
COPY jpa jpa
COPY backend_generated_app_8ffde021_d2f4_40f4_ac09_bcfc69ffac9c backend_generated_app_8ffde021_d2f4_40f4_ac09_bcfc69ffac9c
RUN mvn clean package -DnoTest=true

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/backend_generated_app_8ffde021_d2f4_40f4_ac09_bcfc69ffac9c/target/generated_app-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
ENTRYPOINT ["sh", "-c"]
CMD ["java -jar generated_app-0.0.1-SNAPSHOT.jar"]