#!/bin/bash

# Brandon Rodrigo Henríquez Mejía.

# --------- Funciones ------------
# Creando Directorio
CreandoDirectorio() {
  read -p "Ingresa la ruta donde crearás tu directorio: " ruta
  read -p "Ingresa el nombre del directorio: " nombre

  if [ -d "$ruta/$nombre" ]; then
    echo "Este directorio YA EXISTE"
  else
    mkdir "$ruta/$nombre"
    echo "Directorio creado con Éxito"
  fi
}

# Listando
ListarContenido() {
  read -p "Ingresa la ruta del directorio a listar: " ruta
  ls "$ruta"
}

# Creando Archivo de Texto
CreandoArchivo() {
  read -p "Ingresa la ruta donde se creará el archivo: " ruta
  read -p "Ingresa el nombre del archivo: " nombre
  read -p "¿Estás seguro de la creación del archivo? (s/n): " respuesta

  if [ "$respuesta" = "s" ]; then
    read -p "Ingresa el contenido del archivo (texto): " contenido
    echo "$contenido" > "$ruta/$nombre"
    echo "Archivo creado con Éxito"
  else
    touch "$ruta/$nombre"
    echo "Archivo creado con Éxito"
  fi
}

# Leer Archivo
LeerArchivo() {
  read -p "Ingresa la ruta del archivo a leer: " ruta
  read -p "Ingresa el nombre del archivo: " nombre

  if [ -f "$ruta/$nombre" ]; then
    cat "$ruta/$nombre"
  else
    echo "Este archivo NO EXISTE"
  fi
}

# Eliminar Directorio o Archivo
Eliminar() {
  read -p "Ingresa la ruta del directorio o archivo a eliminar: " ruta
  read -p "Ingresa el nombre del directorio o archivo: " nombre

  if [ -d "$ruta/$nombre" ] || [ -f "$ruta/$nombre" ]; then
    read -p "¿Seguro que quieres eliminar el archivo: $nombre? (s/n): " respuesta
    if [ "$respuesta" = "s" ]; then
      rm -r "$ruta/$nombre"
      echo "ELIMINADO EXITOSAMENTE"
    fi
  else
    echo "El Directorio o Archivo NO EXISTE"
  fi
}

# Menú principal
while true; do
  echo "---- Gestión de Directorios y Ficheros ----"
  echo "1. Crear un directorio"
  echo "2. Listar el contenido de un directorio"
  echo "3. Crear un fichero de texto"
  echo "4. Dar lectura a un fichero"
  echo "5. Eliminar un directorio o fichero"
  echo "6. Salir del programa"

  read -p "Ingresa una opción: " opcion

  case $opcion in
    1) CreandoDirectorio;;
    2) ListarContenido;;
    3) CreandoArchivo;;
    4) LeerArchivo;;
    5) Eliminar;;
    6) break;;
    *) echo "Esta opcion NO EXISTE amigo mio uwu";;
  esac

  echo ""
done