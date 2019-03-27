# Each instruction in this file generates a new layer that gets pushed to your local image cache

# we will base our new image on the 'alpine' Linux distribution 
FROM alpine

# Identify the maintainer of an image
LABEL maintainer="myname@somecompany.com"

COPY run_from_container.sh /run_from_container.sh

CMD ["/run_from_container.sh"]
