FROM ubuntu:20.04

# Avoiding Error
ENV DEBIAN_FRONTEND noninteractive

# Set TimeZone
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install general packages
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends \
	apt-utils \
	python3-pip \
	git \
	nodejs \
	npm \
	curl \
	bash-completion \
	&& npm install n -g \
	&& n stable \
	&& apt-get remove -y --purge nodejs npm \
	# clean to reduce image size \
	&& apt-get clean -y \
	&& apt-get autoremove -y \
	&& apt-get autoclean -y

# Install latex packages
RUN apt-get install -y --no-install-recommends \
	texlive-lang-japanese \
	texlive-lang-english \
	texlive-luatex \
	texlive-latex-recommended \
	texlive-latex-extra \
	fonts-lmodern \
	texlive-xetex \
	latex-cjk-common \
	texlive-fonts-recommended \
	texlive-fonts-extra \
	texlive-extra-utils \
	latexmk \
	liblog-log4perl-perl \
	libyaml-tiny-perl \
	libfile-homedir-perl \
	liblog-dispatch-perl \
	# clean to reduce image size \
	&& apt-get clean -y \
	&& apt-get autoremove -y  \
	&& apt-get autoclean -y
COPY .latexmkrc /root

# Install neovim
RUN apt-get install -y --no-install-recommends software-properties-common \
	&& add-apt-repository ppa:neovim-ppa/unstable \
	&& apt-get install -y --no-install-recommends neovim  \
    && git clone https://github.com/kbryy/nvim-files.git ~/.config/nvim

# Install python packages
COPY requirements.txt .
RUN pip3 install --upgrade pip \
	&& pip3 install --no-cache-dir -r requirements.txt \
	&& rm requirements.txt

# Setting Bash
# COPY .bashrc  /root/.bashrc
COPY .inputrc /root/.inputrc
RUN echo ". /usr/share/bash-completion/bash_completion" >> /etc/bash.bashrc


WORKDIR /code
