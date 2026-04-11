FROM ubuntu:24.04


RUN apt update && \
    apt install -y \
        openjdk-25-jdk && \
    apt clean

WORKDIR /app

COPY . .

RUN ./gradlew build -x test --no-daemon

EXPOSE 8080

CMD ["java", "-jar", "build/libs/app.jar"]