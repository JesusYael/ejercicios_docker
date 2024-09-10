# Descargar la imagen de ubuntu
FROM ubuntu:22.04

# Actualizar la lista de actualizaciones

RUN apt-get update

# Actualizar la imagen

RUN apt-get upgrade -y

# Instalar python

RUN apt-get install python3 -y

# Copiar laa carpeta webapp

COPY ./WebApp /home/webapp

# Establecer el directorio de trabajo

WORKDIR /home/webapp

# Instalar pip

RUN apt-get install python3-pip -y

#Instalar requirements.txt

RUN pip3 install -r requirements.txt

# Abrir el puerto 8080

EXPOSE 8080

#Ejecutar la aplicacion

CMD ["python3", "app.py"]
