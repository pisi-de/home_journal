FROM registry.fedoraproject.org/fedora-minimal:38

RUN dnf5 install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-38.noarch.rpm && \
    dnf5 install -y \
    python3 \
    python3-pip \
    file-libs \
    ffmpeg && \
    dnf5 clean all -y

WORKDIR /app
COPY src/ /app/
COPY .config/requirements.in ./

RUN pip install --force-reinstall -v "Pillow==9.5.0" && \
    pip install -r /app/requirements.in

VOLUME [ "/mnt/site" ]
EXPOSE 8000

ENTRYPOINT ["python", "-m", "home_journal"]
CMD ["--log_file", "/mnt/site/hj.log", \
    "--log_level","debug", \
    "--site_directory", "/mnt/site", \
    "--tags","family,friends,food,home,travel", \
    "--init"]
