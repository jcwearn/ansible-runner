FROM python:3.14-slim@sha256:cae66f2ef0ec51a9891263eeee7f987dacf0a9879e8aa9353d5606e0530619a5

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible-core jmespath && \
    ansible-galaxy collection install -p /usr/share/ansible/collections community.general ansible.posix

ENV ANSIBLE_COLLECTIONS_PATH=/usr/share/ansible/collections

RUN useradd -r -m -s /bin/bash ansible
USER ansible

ENTRYPOINT ["ansible-playbook"]
