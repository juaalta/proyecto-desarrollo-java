# proyecto-desarrollo-java

Proyecto de Java basado en contenedores Docker

Estas instrucciones porporcionan una copia del proyecto en funcionamiento en su máquina local, para fines de desarrollo y prueba.


## Prerequisitos

Se necesita tener instalado Docker y Make.


## Estructura del proyecto

El proyecto está estructurado de la siguiente forma:

* Carpetas y ficheros relacionados con dockers para desarrollo.
* Carpetas y ficheros relacionados con dockers de despliegue.
* Resto de ficheros.


### Carpetas y ficheros relacionados con dockers para desarrollo

Son las carpetas y ficheros relacionados con Docker a usar por los programadores para su trabajo diario.

Éstas son:

* `docker/develop/`: carpeta que contiene la imagen de docker que se usa para desarrollar la aplicación.
* `scripts/`: los siguientes scripts son lo que se usan para el desarrollo de la aplicación:
  * `cleanup.sh`: limpia el docker usado para desarrollo.
  * `mvn_cmd.sh`: lanza un comando de Maven dentro del docker de desarrollo.
  * `start.sh`: compila el proyecto usando Maven.


### Carpetas y ficheros relacionados con dockers de despliegue

Son las carpetas y ficheros relacionados con Docker a usar por los despliegues.

Éstas son:

* `Makefile`: fichero makefile que contiene todos los comandos a ejecutar para generar el docker de despliegue y su subida a un repositorio de contenedores.
  * `config.env`: configuración de las variables de entorno a usar por el docker de despliegue.
  * `deploy.env`: configuración de las variables de entorno a usar por docker para la genración del docker de despliegue y subida al repositorio de contenedores.
* `docker/`: carpeta que contiene la imagen de docker que se usa para desarrollar la aplicación.
* `scripts/`: los siguientes scripts son lo que se usan por el Makefile para poder realizar su trabajo:
  * `app_name.sh`: obtiene el nombre de la aplicación a partir de los datos del fichero `pom.xml`.
  * `version.sh`: obtiene la versión de la aplicación a partir de los datos del fichero `pom.xml`.


### Resto de ficheros

El resto de ficheros del proyecto son los ficheros referidos al código de dicho proyecto.


## Trabajando con el proyecto

Una vez clonado éste proyecto los pasos a seguir para trabajar en el proyecto son:


### Trabajo normal de los desarrolladores

* Ejecución de la compilación usando maven.

``` bash
./scripts/build.sh
```

* Si se quiere ejecutar cualquier comando de maven no sea `clean install`:

``` bash
./scripts/mvn_cmd.sh <comando con parámetros>
```

Limpiar el sistema:

``` bash
./scripts/cleanup.sh
```


### Generación del contenedor Docker y subida a repositorio de imágenes

Para la generación del contenedor y la subida de imágenes se ha creado un fichero `Makefile`, el cual tiene todos los pasos para poder generar el docker y subirlo a un repositorio de imágenes.

Los comandos básicos para trabajar con el fichero makefile son:

* `make` o `make help`: muestra la ayuda, con la lista completa de comandos.
* `make build`: genera la imagen de docker a subir al repostorio.
* `make test`: ejecuta la imagen de docker, lanzando los tests que tiene implementados en la aplicación contenida en la imagen docker.
* `make publish`: publica la imagen de docker en un repositorio.

