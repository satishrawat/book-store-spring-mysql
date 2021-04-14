FROM java:8
VOLUME /tmp
EXPOSE 8080
ADD /build/libs/book-store-spring-mysql-1.0-SNAPSHOT.jar book-store-spring-mysql-1.0-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","book-store-spring-mysql-1.0-SNAPSHOT.jar"]
