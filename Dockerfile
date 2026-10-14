# Base image JRE Alpine gọn nhẹ, bảo mật
# -> ĐỔI NẾU KHÁC DỰ ÁN: Java 21 dùng 'eclipse-temurin:21-jre-alpine', Java 11 dùng 'eclipse-temurin:11-jre-alpine'
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Khai báo đường dẫn file JAR build ra
# -> ĐỔI NẾU KHÁC DỰ ÁN: Gradle là 'build/libs/*.jar' | Maven là 'target/*.jar'
ARG JAR_FILE=build/libs/*.jar

COPY ${JAR_FILE} app.jar

# Cổng lắng nghe của Spring Boot
# -> ĐỔI NẾU KHÁC DỰ ÁN: Đổi theo server.port trong application.properties (ví dụ 8081, 3000)
EXPOSE 8080

ENV JAVA_OPTS="-Xms256m -Xmx512m"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]