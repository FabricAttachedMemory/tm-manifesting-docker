FROM debian:stretch

#RUN echo "deb http://seedy.us.rdlabs.hpecorp.net/debian/ stretch main non-free contrib" > /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y

#RUN apt install -y python3 python3-psutil git python3-requests
RUN dpkg --add-architecture arm64
RUN apt update -y
#RUN apt search grub-efi-arm64-bin
RUN apt install -y apt-utils
#RUN apt install -y grub-efi-arm64-bin
#RUN apt install -y qemu-efi
RUN apt install -y python3
#RUN apt install -y vmdebootstrap

#ADD ./test.py /
#RUN python3 ./test.py
#RUN ls -l /usr/local/lib/python3.5/
#RUN ln -s /tm-manifesting /usr/local/lib/python3.5/dist-packages/tmms

#RUN git clone https://github.com/FabricAttachedMemory/tm-manifesting.git -b zach_dev

ADD ./tm-manifesting/ /root/tm-manifesting/

WORKDIR /root/tm-manifesting/
RUN ./setup.py environment
RUN echo $?

EXPOSE 31178

#CMD ["python3", "manifest_api.py"]
