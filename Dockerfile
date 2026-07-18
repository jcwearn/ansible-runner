FROM python:3.14-slim@sha256:cea0e6040540fb2b965b6e7fb5ffa00871e632eef63719f0ea54bca189ce14a6

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible-core jmespath && \
    ansible-galaxy collection install -p /usr/share/ansible/collections community.general ansible.posix

ENV ANSIBLE_COLLECTIONS_PATH=/usr/share/ansible/collections

RUN useradd -r -m -s /bin/bash ansible
USER ansible

ENTRYPOINT ["ansible-playbook"]
