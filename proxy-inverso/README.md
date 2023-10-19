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
