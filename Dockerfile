FROM alpine

COPY run_from_container.sh /run_from_container.sh

CMD ["/run_from_container.sh"]
