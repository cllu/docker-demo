FROM nginx:1.9.14

RUN apt-get update \
	&& apt-get install -y unzip \
	&& rm -rf /var/lib/apt/lists/*

ADD https://releases.hashicorp.com/consul-template/0.12.2/consul-template_0.12.2_linux_amd64.zip /usr/bin/
RUN unzip /usr/bin/consul-template_0.12.2_linux_amd64.zip -d /usr/local/bin

ADD docker/load_balancer/default.ctmpl /templates/default.ctmpl
ADD docker/load_balancer/start.sh /bin/start.sh
RUN chmod +x /bin/start.sh

EXPOSE 80
ENTRYPOINT ["/bin/start.sh"]