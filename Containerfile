FROM registry.fedoraproject.org/fedora-minimal:38

RUN dnf5 install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-38.noarch.rpm && \
    dnf5 install -y \
        python3 \
        python3-pip \
        file-libs \
        ffmpeg && \
    dnf5 clean all -y

RUN pip install --force-reinstall -v "Pillow==9.5.0" && \
    pip install --root-user-action=ignore \
        home-journal==0.0.8
