FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-client && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir ansible-core jmespath && \
    ansible-galaxy collection install community.general

RUN useradd -r -s /usr/sbin/nologin ansible
USER ansible

ENTRYPOINT ["ansible-playbook"]
