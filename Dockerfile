#
# Dockerfile for cloudmapper
#

FROM python:3.7.2

RUN apt-get update \
	&& apt-get install -y jq autoconf automake libtool python3-dev \
	&& pip install awscli \
	&& apt-get clean \
	&& git clone https://github.com/duo-labs/cloudmapper.git \
	&& cd /cloudmapper \
	&& pip3 install pipenv \
	&& pipenv install --skip-lock

WORKDIR /cloudmapper

COPY credentials /root/.aws/credentials 
COPY config.json config.json

RUN pipenv run python3 cloudmapper.py collect --config config.json
RUN pipenv run python3 cloudmapper.py prepare --config config.json --regions eu-central-1

ENTRYPOINT ["pipenv", "run", "python", "cloudmapper.py", "webserver", "--public"]	

EXPOSE 8000