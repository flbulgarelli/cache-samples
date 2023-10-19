Caché en memoria
=================

En este directorio encontrarás un ejemplo de caché HTTP utilizando `redis`como caché en memoria y un servidor escrito en ruby para conectarse a éste.

## Iniciar el servidor de localidades

Iniciá el servidor de provincias y localidades como se indica en el `README` en la raíz.

## Iniciar redis

```bash
cd cache-en-memoria
docker run --rm -it --net host \
    --name cache-samples-redis \
  redis
```

## Iniciar servidor de caché

```bash
bundle exec rackup -p 8081
```

## Consulta al servidor de caché

```bash
# repetir las operaciones múltiples veces
curl http://localhost:8081/provincias/ -S
curl http://localhost:8081/provincias/94 -S
curl http://localhost:8081/provincias/94/localidades -S
```
