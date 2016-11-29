FROM ubuntu:16.04


RUN apt-get update \
    && apt-get -y install \
            openssh-server \
            net-tools \
            iproute \
            traceroute \
            iputils-ping \
            libmagickwand-6.q16-2 \
            libmemcached11 \
            libmemcachedutil2 \
            libyaml-0-2 \
            php7.0-common \
            php7.0-cli \
            php7.0-curl \
            php7.0-gd \
            php7.0-gmp \
            php-imagick \
            php7.0-intl \
            php7.0-json \
            php7.0-mbstring \
            php7.0-mcrypt \
            php-memcached \
            php7.0-mysql \
            php7.0-readline \
            php7.0-bcmath \
            php7.0-soap \
            php7.0-xml \
            php7.0-zip\
            curl \
            && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
#CMD ["bash"]
