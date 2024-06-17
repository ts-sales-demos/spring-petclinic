FROM amazoncorretto:17.0.7-alpine

ARG APP_VER=3.3.0
ARG APP_NAME=spring-petclinic

# Add app user
ARG APPLICATION_USER=appuser
RUN adduser --no-create-home -u 1000 -D $APPLICATION_USER

# Configure working directory
RUN mkdir /app && \
    chown -R $APPLICATION_USER /app

USER 1000

COPY --chown=1000:1000 ./target/$APP_NAME-$APP_VER-SNAPSHOT.jar /app/$APP_NAME.jar
WORKDIR /app

EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/app/$APP_NAME.jar" ]
