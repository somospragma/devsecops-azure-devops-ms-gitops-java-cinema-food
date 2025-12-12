# Etapa 1: Usamos una imagen base con JDK 17
FROM eclipse-temurin:17-jdk AS base
WORKDIR /app

# Copiamos el archivo JAR previamente generado (esto debe haberse generado antes y debe estar disponible en el contexto de Docker)
COPY build/libs/*.jar app.jar

# Punto importante: el path esperado del archivo
ENV PATH_FILE=/data/food.txt

# Crear el directorio antes de copiar
RUN mkdir -p /app/init

# Copiamos el archivo original como punto de partida
COPY src/main/resources/food.txt /app/init/food.txt

# Verificamos que se copió correctamente
RUN ls -l /app/init

# Aseguramos permisos de lectura para el archivo
RUN chmod 644 /app/init/food.txt

EXPOSE 8082
ENTRYPOINT ["java", "-jar", "app.jar"]
