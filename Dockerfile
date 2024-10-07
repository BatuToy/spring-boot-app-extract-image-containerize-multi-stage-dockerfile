# --------------- STAGE 1 --------------
#FROM maven:3.8.5-openjdk-17 AS development
#WORKDIR /app
#COPY pom.xml .
#COPY src ./src
#RUN mvn clean install
# --------------- STAGE 2 --------------
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
# Fetch all the dependencies and Cache all of them
RUN mvn dependency:go-offline -B
COPY src ./src
# Build the project and packages it to a .jar file
RUN mvn clean package -DskipTests
# --------------- STAGE 3 ---------------
FROM openjdk:17-jdk-slim AS production
WORKDIR /app
# Fetch the .jar file as a builded file and place to container directory as a "app" file.
COPY --from=build ./app/target/demo_docker_multistaging-0.0.1-SNAPSHOT.jar /app/app.jar
EXPOSE 8081
CMD ["java", "-jar", "/app/app.jar"]

# How to build an image a .Dockerfile -> docker build -t <image-name>
# How to dockerize an image -> docker run -dit -p <inport>:<outport> --name <container-name> <image-name>



