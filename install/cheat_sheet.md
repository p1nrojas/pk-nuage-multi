# Create your containers

Let's start with the data-only-container and then with the app one.

```
docker run -d --name pk-nuage-data-only p1nrojas/pk-nuage-multi true
docker run -d -i -t --volumes-from pk-nuage-data-only --name pk-nuage-ansible  p1nrojas/pk-nuage-multi
```

# Build you image

```
docker build -t p1nrojas/pk-nuage-multi .
```

# Get access to a container
```
docker exec -i -t pk-nuage-ansible /bin/bash
```
