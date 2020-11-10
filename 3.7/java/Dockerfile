  # vim:set ft=dockerfile:

FROM cimg/base:2020.06

SHELL ["/bin/bash", "-c"]

LABEL maintainer="Community/ Engineering <community-partner@contractshark.com>"

ENV PYENV_ROOT=/home/circleci/.pyenv \
	PATH=/home/circleci/.pyenv/shims:/home/circleci/.pyenv/bin:/home/circleci/.poetry/bin:$PATH

RUN sudo apt-get update && sudo apt-get install -y \
		build-essential \
		ca-certificates \
		curl \
		git \
		libbz2-dev \
		liblzma-dev \
		libncurses5-dev \
		libncursesw5-dev \
		libreadline-dev \
		libffi-dev \
		libsqlite3-dev \
		libssl-dev \
		libxml2-dev \
		libxmlsec1-dev \
		llvm \
		make \
		python-openssl \
		tk-dev \
		wget \
		xz-utils \
		zlib1g-dev && \
	curl https://pyenv.run | bash && \
	sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pyenv install 3.7.9 && pyenv global 3.7.9

RUN python --version && \
	pip --version && \
	# This installs pipenv at the latest version, currently 2020.6.2
	pip install pipenv wheel

# This installs version poetry at the latest version. poetry is updated about twice a month.
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV JAVA_HOME=/usr/lib/jvm/zulu-13-amd64/


ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ARG ZULU_REPO_VER=1.0.0-2

RUN sudo apt-get -qq update && \
    sudo apt-get -qq -y --no-install-recommends install gnupg software-properties-common locales curl && \
    sudo locale-gen en_US.UTF-8 && \
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 && \
    curl -sLO https://cdn.azul.com/zulu/bin/zulu-repo_${ZULU_REPO_VER}_all.deb && dpkg -i zulu-repo_${ZULU_REPO_VER}_all.deb && \
    sudo apt-get -qq update && \
    sudo apt-get -qq -y dist-upgrade && \
    mkdir -p /usr/share/man/man1 && \
    sudo apt-get -qq -y --no-install-recommends install zulu11-jdk=11.0.8-* && \
    sudo apt-get -qq -y purge gnupg software-properties-common curl && \
    sudo apt -y autoremove && \
    sudo rm -rf /var/lib/apt/lists/* zulu-repo_${ZULU_REPO_VER}_all.deb

ENV JAVA_HOME=/usr/lib/jvm/zulu11-ca-amd64
