podman run --volume /mnt/site:/mnt/site --publish 9000:8000 home-journal \
    home-journal --log_file /mnt/site/hj.log \
        --log_level debug \
        --site_directory /mnt/site \
        --tags family,friends,food,home,travel \
        --init
