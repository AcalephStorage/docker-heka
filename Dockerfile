
# BUILD: docker build --rm -t acaleph/heka .
# RUN:   docker run acaleph/heka

FROM ubuntu:trusty
MAINTAINER Acaleph <admin@acale.ph>

RUN apt-get update && apt-get install -y wget

RUN wget -P /tmp https://github.com/mozilla-services/heka/releases/download/v0.5.2/heka_0.5.2_amd64.deb
RUN dpkg -i /tmp/heka_0.5.2_amd64.deb
RUN rm /tmp/heka_0.5.2_amd64.deb

# Heka Dashboard
EXPOSE 4352

VOLUME ["/etc/hekad"]

ENTRYPOINT ["hekad"]
CMD ["-help"]