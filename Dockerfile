# syntax=docker/dockerfile:1
FROM amazonlinux:2023

# Install OS packages...
RUN yum install -y git gcc gcc-c++ cpp cpio make cmake automake libtool autoconf chkconfig clang clang-libs dos2unix zlib zlib-devel zip unzip tar perl libxml2 bzip2 bzip2-libs xz xz-libs pkgconfig
RUN yum install -y which

ADD build /root/build

# Remove the ones you don't need...
RUN /root/build/build_libde265.sh
RUN /root/build/build_libjpeg.sh
RUN /root/build/build_libpng.sh
RUN /root/build/build_libwebp.sh
RUN /root/build/build_libheif.sh
RUN /root/build/build_libopenjp2.sh
RUN /root/build/build_libtiff.sh
RUN /root/build/build_libbz2.sh
RUN /root/build/build_lcms.sh

RUN echo 'PS1="\D{%m-%d-%Y %H:%M:%S} \w # "' >> /etc/bashrc
# And finally...
RUN /root/build/build_imagemagick.sh
