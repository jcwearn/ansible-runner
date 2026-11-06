FROM python:3.15-slim@sha256:e97b88e416c3c01eb427b21fd8cd3ebf006e6ee38afcfcc3cae1c54ee2ab0a75

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible-core jmespath && \
    ansible-galaxy collection install -p /usr/share/ansible/collections community.general ansible.posix

ENV ANSIBLE_COLLECTIONS_PATH=/usr/share/ansible/collections

RUN useradd -r -m -s /bin/bash ansible
USER ansible

ENTRYPOINT ["ansible-playbook"]
