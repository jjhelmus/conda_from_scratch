FROM centos:6

# Set the locale
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Resolves a nasty NOKEY warning that appears when using yum.
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

# base packages
RUN yum install -y \
    file \
    libX11 \
    libXau \
    libxcb \
    libXdmcp \
    libXext \
    libXrender \
    libXt \
    mesa-libGL \
    mesa-libGLU \
    openssh-clients \
    patch \
    rsync \
    util-linux \
    wget \
    which \
    bzip2 \
    xorg-x11-server-Xvfb \
  && yum clean all

# ctng packages
RUN yum install -y \
    autoconf \
    gperf  \
    bison  \
    flex  \
    texinfo  \
    help2man  \
    gcc-c++  \
    patch \
	ncurses-devel  \
    python-devel  \
    perl-Thread-Queue  \
    bzip2  \
    git \
  && yum clean all

#crosstool-ng packages
RUN yum install -y \
    automake \
    libtool \
    make \
    unzip \
  && yum clean all

RUN yum install -y \
    bzip2-devel \
    sqlite-devel \
    readline-devel \
    tk-devel \
    libffi-devel \
  && yum clean all

WORKDIR /build_scripts
COPY stuff.sh /build_scripts

RUN source /build_scripts/stuff.sh \
    && build_openssl

RUN source /build_scripts/stuff.sh \
    && build_python

RUN source /build_scripts/stuff.sh \
    && install_conda_deps

RUN source /build_scripts/stuff.sh \
    && build_conda

ENV PATH="/opt/cfs/bin:${PATH}"

CMD [ "/bin/bash" ]
