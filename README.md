# docker-webNUT

webNUT (UPS network monitoring web ui) dockerized. Uses a fork of webNUT that supports multiple servers. More info on webNUT: https://github.com/AdeMiller/webNUT

Create a config directory and file `webnut/config.py` to be mounted in the container:

```python
from .webnut import NUTServer

servers = [
    NUTServer('ip.of.nut.server', 3493, "username1", "password1"),
    NUTServer('ip.of.nut.server2', 3493, "username2", "password2"),
    # etc
]
```

Docker-compose setup:

```json
version: "3.1"

networks:
  proxy:
    external: true

services:
  webnut:
    image: ghcr.io/sethvoltz/webnut
    container_name: webnut
    networks:
      - proxy
    ports:
      - 6543:6543
    volumes:
      - webnut:/app/webNUT/webnut
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
```
