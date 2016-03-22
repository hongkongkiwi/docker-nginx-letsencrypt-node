FROM nginx:stable

RUN runtimeDeps='inotify-tools' \
	&& apt-get update && apt-get install -y $runtimeDeps --no-install-recommends

COPY letsencryptauth.conf /etc/nginx/snippets/letsencryptauth.conf
COPY sslconfig.conf /etc/nginx/snippets/sslconfig.conf

VOLUME /etc/nginx/dhparam

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
