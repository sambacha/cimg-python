#!/usr/bin/env bash

docker build --file 3.6/browsers/Dockerfile -t sambacha/python:3.6.12-browsers  -t sambacha/python:3.6-browsers .
docker build --file 3.7/browsers/Dockerfile -t sambacha/python:3.7.9-browsers  -t sambacha/python:3.7-browsers .
