# Create a NSRL lookup micro-service

```bash
$ docker run -d -p 3993:3993 malice/totalhash:sha1 web

INFO[0000] web service listening on port :3993
```

Now you can perform queries like so

```bash
$ http localhost:3993/5a272b7441328e09704b6d7eabdbd51b8858fde4
```

```bash
HTTP/1.1 200 OK
Content-Length: 24
Content-Type: application/json; charset=UTF-8
Date: Sun, 20 Nov 2016 21:43:30 GMT

{
    "totalhash": {
        "found": true
    }
}
```
