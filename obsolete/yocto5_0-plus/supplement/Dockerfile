FROM crops/poky:debian-12

# https://www.docker.com/blog/docker-best-practices-choosing-between-run-cmd-and-entrypoint/
# CMD ["/usr/bin/distro-entry.sh", "/usr/bin/dumb-init", "--", "/usr/bin/poky-entry.py"]
# CMD "/bin/bash"
CMD "/usr/bin/python3"
ENTRYPOINT ["/usr/bin/distro-entry.sh", "/usr/bin/dumb-init", "--", "/usr/bin/poky-entry.py"]
