FROM python:3.14-slim@sha256:63a4c7f612a00f92042cbdcc7cdc6a306f38485af0a200b9c89de7d9b1607d15

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible-core jmespath && \
    ansible-galaxy collection install -p /usr/share/ansible/collections community.general ansible.posix

ENV ANSIBLE_COLLECTIONS_PATH=/usr/share/ansible/collections

RUN useradd -r -m -s /bin/bash ansible
USER ansible

ENTRYPOINT ["ansible-playbook"]
