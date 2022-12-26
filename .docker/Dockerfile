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
	&& apt-get install -y --no-install-recommends neovim \
	&& mkdir -p ~/.config/nvim \
	&& git clone https://github.com/Kobari12/neovim-config.git ~/.config/nvim \
	&& curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim \
	&& mkdir -p ~/.local/share/fonts \
	&& cd ~/.local/share/fonts \
	&& curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf \
	&& LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/') \
	&& curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" \
	&& tar xf lazygit.tar.gz -C /usr/local/bin lazygit \
	&& rm lazygit.tar.gz

# Install python packages
COPY requirements.txt .
RUN pip3 install --upgrade pip \
	&& pip3 install --no-cache-dir -r requirements.txt \
	&& rm requirements.txt

# Setting Bash
COPY .bashrc  /root/.bashrc
COPY .inputrc /root/.inputrc
RUN echo ". /usr/share/bash-completion/bash_completion" >> /etc/bash.bashrc


WORKDIR /home/mycode
