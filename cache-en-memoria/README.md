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

## Ver Caché en vivo

```bash
$ docker exec -it cache-samples-redis redis-cli
127.0.0.1:6379> KEYS *
1) "servidor:/provincias/:{}"
127.0.0.1:6379> KEYS *
1) "servidor:/provincias/46:{}"
2) "servidor:/provincias/:{}"
127.0.0.1:6379> GET "servidor:/provincias/46:{}"
"{\"headers\":{\"content-type\":\"application/json\",\"x-content-type-options\":\"nosniff\",\"content-length\":\"213\"},\"body\":\"{\\\"nombre_completo\\\":\\\"Provincia de La Rioja\\\",\\\"fuente\\\":\\\"IGN\\\",\\\"iso_id\\\":\\\"AR-F\\\",\\\"nombre\\\":\\\"La Rioja\\\",\\\"id\\\":\\\"46\\\",\\\"categoria\\\":\\\"Provincia\\\",\\\"iso_nombre\\\":\\\"La Rioja\\\",\\\"centroide\\\":{\\\"lat\\\":-29.685776298315,\\\"lon\\\":-67.1817359694432}}\"}"
127.0.0.1:6379> TTL "servidor:/provincias/46:{}"
(integer) 3553
127.0.0.1:6379> TTL "servidor:/provincias/:{}"
(integer) 3418
127.0.0.1:6379> TTL "servidor:/provincias/:{}"
(integer) 3412
127.0.0.1:6379> TTL "servidor:/provincias/:{}"
(integer) 3411
127.0.0.1:6379> TTL "servidor:/provincias/:{}"
(integer) 3410
127.0.0.1:6379> TTL "servidor:/provincias/:{}"
(integer) 3409
127.0.0.1:6379>
```