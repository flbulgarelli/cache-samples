Ejemplos de Caché
=================

> Ejemplos de implementación de caché para un API HTTP

## Iniciar el servidor de localidades

El directorio `servidor` contiene un servidor de demostración que provee información
de provincias y localidades argentinas.

```bash
cd servidor
bundle exec ruby app.rb -p 8000
```

El servidor lee la información de dos archivos `json` y responde simulando una demora de 2 segundos.

## Prueba del servidor

```bash
curl http://localhost:8000/provincias/ -S
curl http://localhost:8000/provincias/94 -S
curl http://localhost:8000/provincias/94/localidades -S
```

## Usando caché

En cada uno de los directorios `proxy-reverso`  y `cache-en-memoria` encontrarás instrucciones para probar ambos tipos de caché.

## Fuente de datos

Los datos de provincias y localidades se han obtenido de:

 * https://datos.gob.ar/ar/dataset/jgm-servicio-normalizacion-datos-geograficos/archivo/jgm_8.2
 * https://datos.gob.ar/dataset/jgm-servicio-normalizacion-datos-geograficos/archivo/jgm_8.7