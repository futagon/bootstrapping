# bootstrapping
#
# VERSION 1.0

FROM ubuntu

MAINTAINER toyama satoshi <toyamarinyon@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# install dependency
RUN apt-get -y install curl git-core build-essential libssl-dev man

# Install rbenv, ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile

# Install multiple versions of ruby
ENV CONFIGURE_OPTS --disable-install-doc

# install ruby-2.1.0
RUN rbenv install 2.1.0 
RUN rbenv rehash
RUN rbenv global 2.1.0 
RUN rbenv exec gem install bundler --no-ri --no-doc
RUN rbenv rehash

# install nvm
RUN curl https://raw.github.com/creationix/nvm/master/install.sh | HOME=/root sh
RUN echo '[[ -s /root/.nvm/nvm.sh ]] && . /root/.nvm/nvm.sh' > /etc/profile.d/nvm.sh
RUN echo 'nvm install 0.11' | bash -l
RUN echo 'nvm alias default 0.11' | bash -l

CMD /bin/bash --login
