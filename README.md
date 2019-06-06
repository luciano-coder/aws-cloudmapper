# docker-cloudmapper
Docker Image with duo-labs/cloudmapper installed to visualize AWS Infrastructure

## 1. Config

1. Create a user with the privileges you find here: https://github.com/duo-labs/cloudmapper#aws-privileges-required
2. Add the credentials to the `credentials`file in this folder
3. Add your account id to `config.json`

## 2. Build

``` bash
docker build -t cloudmapper .
```

## 3. Run

``` bash
docker run -it -p 8000:8000 cloudmapper
```
