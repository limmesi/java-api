FROM maven:latest

WORKDIR /java-api
COPY . /java-api

ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_HOST
ARG DB_NAME

ENV DB_USERNAME {$DB_USERNAME}
ENV DB_PASSWORD {$DB_PASSWORD}
ENV DB_HOST     {$DB_HOST    }
ENV DB_NAME     {$DB_NAME    }

RUN mvn clean install -DskipTests=true
EXPOSE 8080

CMD ["java", "-jar", "/java-api/target/JavaWebService-1.0-SNAPSHOT.jar", "server", "/java-api/config.yml"]
