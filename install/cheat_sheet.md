# Create your containers

Let's start with the data-only-container and then with the app one.

```
docker run -d --name pk-data-only p1nrojas/pk-sdnlab-stdalone true
docker run -d -i -t --volumes-from pk-data-only --name pk-ansible  p1nrojas/pk-sdnlab-stdalone
```

# Build you image

```
docker build -t p1nrojas/pk-sdnlab-stdalone
```

# Get access to a container
```
docker exec -i -t pk-ansible /bin/bash
```
