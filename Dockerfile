FROM python:3.14-slim@sha256:71b358f8bff55413f4a6b95af80acb07ab97b5636cd3b869f35c3680d31d1650

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible-core jmespath && \
    ansible-galaxy collection install -p /usr/share/ansible/collections community.general ansible.posix

ENV ANSIBLE_COLLECTIONS_PATH=/usr/share/ansible/collections

RUN useradd -r -m -s /bin/bash ansible
USER ansible

ENTRYPOINT ["ansible-playbook"]
