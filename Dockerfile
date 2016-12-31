FROM ubuntu:xenial
MAINTAINER Junya Ogasawara <like.bump.oga@gmail.com>

RUN set -x && \
      sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list && \
      apt update && apt -y upgrade && \
      apt -y install git wget software-properties-common && \
      apt-add-repository -y ppa:texlive-backports/ppa && \
      apt -y install texlive-lang-cjk latexmk && \
      wget http://mirrors.ctan.org/macros/latex/contrib/docmute.zip && \
      wget http://mirrors.ctan.org/macros/latex/contrib/listings.zip && \
      unzip docmute.zip && \
      unzip listings.zip && \
      rm docmute.zip listings.zip && \
      mv docmute /usr/share/texmf/tex/latex/ && \
      mv listings /usr/share/texmf/tex/latex/ && \
      cd /usr/share/texmf/tex/latex/listings && \
      platex *.ins && \
      cd - && \
      mktexlsr && \
      apt autoremove && \
      apt clean && \
      kanji-config-updmap-sys auto

WORKDIR /data
VOLUME ["/data"]
