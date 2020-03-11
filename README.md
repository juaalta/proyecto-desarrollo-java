# proyecto-desarrollo-java

Proyecto de Java basado en contenedores Docker


Estas instrucciones porporcionan una copia del proyecto en funcionamiento en su máquina local, para fines de desarrollo y prueba.

## Prerequisitos

Se necesitan tener instalados Docker y Docker-compose.

<https://docs.docker.com/compose/install/>


## Trabajando con el proyecto

Una vez clonado éste proyecto los pasos a seguir para trabajar son:

* Arrancar el entorno en background y mostrar los logs del contenedor

``` bash
./bin/start
```

El cancelar la ejecución no para el entorno, sólo deja de mostrar los logs.


* Si se ha cancelado la visualización de logs y quiere volver a conectar a los logs:

``` bash
./bin/logs
```

Limpiar el sistema:

``` bash
./bin/cleanup
```


Licencia
