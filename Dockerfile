FROM nginx:stable

ARG http_proxy
ARG https_proxy

RUN ln -sf /dev/stderr /var/log/nginx/error.log
RUN chmod go+rwX -R /var /run
VOLUME /media

COPY entrypoint.sh /
COPY nginx.conf /etc/nginx/

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
