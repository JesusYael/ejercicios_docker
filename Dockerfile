# Descargar la imagen de ubuntu
FROM ubuntu:22.04

# Actualizar la lista de actualizaciones e instalar las dependencias necesarias
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar la carpeta webapp
COPY ./WebApp /home/webapp

# Establecer el directorio de trabajo
WORKDIR /home/webapp

# Instalar requirements.txt
RUN pip3 install -r requirements.txt

# Abrir el puerto 8080
EXPOSE 8080

# Ejecutar la aplicación
CMD ["python3", "app.py"]
