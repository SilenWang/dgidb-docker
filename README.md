# DGIdb-Docker: Dockerfile to build a container with DGIdb service

## Introduction
[DGIdb](https://dgidb.org/) is a user-friendly drug-gene interactions database with information mined from over thirty trusted sources.

This project aims to provide an dockerfile to build the rails frontend service from the [official project](https://github.com/dgidb/dgidb)

The setup process was under the guidence of [official installation instructions](https://github.com/dgidb/dgidb/blob/master/INSTALL-LINUX), and since [they are updating this guidence now](https://github.com/dgidb/dgidb/pull/575), the process may be changed in the future.


## How to use

```
git clone https://github.com/SilenWang/dgidb dgidb
cd dgidb
docker build .
docker run -p 3466:3466 [CONTAINER ID]
```

- **Note**: To accelerate ruby installation in Mainland China, a [plugin](https://github.com/andorchen/rbenv-china-mirror.git) was used.

## Status
- Things work
  + View index page
  + Search drug interaction
  + Search gene interaction
- Things don't work
  + View interaction details