FROM ubuntu:xenial
MAINTAINER Junya Ogasawara <like.bump.oga@gmail.com>

RUN set -x && \
      sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list && \
      apt update && apt -y upgrade && \
      apt -y install git wget software-properties-common && \
      apt-add-repository -y ppa:texlive-backports/ppa && \
      apt -y install texlive-lang-cjk latexmk && \
      wget http://mirrors.ctan.org/macros/latex/contrib/docmute.zip && \
      unzip docmute.zip && \
      mv docmute /usr/share/texmf/tex/latex/ && \
      mktexlsr && \
      kanji-config-updmap-sys auto

WORKDIR /data
VOLUME ["/data"]
