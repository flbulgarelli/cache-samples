Proxy inverso
=============

En este directorio encontrarás un ejemplo de caché HTTP utilizando `nginx` como proxy reverso.

📝 **Nota**: Para ver un ejemplo de `nginx` como balanceador de carga, ver [acá](https://github.com/flbulgarelli/nginx-sample)

## Iniciar el servidor de localidades

Iniciá el servidor de provincias y localidades como se indica en el `README` en la raíz.

## Iniciar `nginx`

```bash
cd proxy-reverso
docker run --net host --rm -it \
  --name cache-samples-nginx \
  -v ./nginx.conf:/etc/nginx/nginx.conf:ro \
  nginx
```

## Consulta al proxy inverso

```bash
# repetir las operaciones múltiples veces
curl http://localhost:8080/provincias/ -S
curl http://localhost:8080/provincias/94 -S
curl http://localhost:8080/provincias/94/localidades -S
```

## Ver contenidos de la caché

```bash
$ docker exec -it cache-samples-nginx /bin/bash
root@host:/# cd /opt/cache/
root@host:/opt/cache# ls
f
root@host:/opt/cache# find .
.
./f
./f/80
./f/80/4ada935543126341eb3519890c9db80f
root@host:/opt/cache# find .
.
./f
./f/80
./f/80/4ada935543126341eb3519890c9db80f
./d
./d/09
./d/09/27c884eaefad50edbff273848102009d
root@host:/opt/cache# cat ./d/09/27c884eaefad50edbff273848102009d
�A<e���������3<e�0��t�
KEY: http://servidor/provincias/46
HTTP/1.0 200 OK
Content-Type: application/json
X-Content-Type-Options: nosniff
Content-Length: 213

{"nombre_completo":"Provincia de La Rioja","fuente":"IGN","iso_id":"AR-F","nombre":"La Rioja","id":"46","categoria":"Provincia","iso_nombre":"La Rioja","centroide":{"lat":-29.685776298315,"lon":-67.1817359694432}}
root@host:/opt/cache#
```