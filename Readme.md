# Turnserver for nextcloud talk

https://nextcloud-talk.readthedocs.io/en/latest/TURN/
```
In many cases, especially in combination with firewalls or symmetric NAT, a direct P2P connection is not possible, even with the help of a STUN server. For this a so called TURN server needs to be configured additionally.
```

## TLS
https://github.com/nextcloud/spreed/issues/257#issuecomment-487169701
* Security benefit of TURNS is very limited (WebRTC encrypted anyway).
* But it allows passing firewalls that allow transport layer encrypted requests only.

# Usage
docker run -d --restart=always --net=host --name coturn -e TURN_SECRET=coturn -e TURN_REALM=myrealm coturn

# With environment file
docker run -d --restart=always --net=host --env-file=.env --name coturn reimar/coturn

## Environment file
```
TURN_SECRET=coturn
TURN_REALM=myrealm
```

## Check version
docker run --rm --name test --entrypoint="" reimar/coturn:foo /bin/sh -c "turnserver --version"

