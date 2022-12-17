FROM ubuntu:20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /home/mycode

RUN apt update     &&\
	apt upgrade -y &&\
	apt install -y python3-pip git nodejs npm curl


# nodejs:latest
RUN npm install n -g && \
	n stable 		 && \
	apt purge -y nodejs npm


# python
COPY requirements.txt .
RUN pip3 install --upgrade pip 						&& \
    pip3 install --no-cache-dir -r requirements.txt 	

# neovim
RUN apt install software-properties-common -y  								&& \
	add-apt-repository ppa:neovim-ppa/unstable 								&& \
	apt install -y neovim 													&& \
	mkdir -p ~/.config/nvim 												&& \
	git clone https://github.com/Kobari12/neovim-config.git ~/.config/nvim 	&& \
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

