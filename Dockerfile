FROM python:2.7
LABEL org.opencontainers.image.authors="seth@seth.to"
LABEL org.opencontainers.image.source="https://github.com/sethvoltz/docker-webnut"

RUN mkdir /app && \
cd /app && \
git clone https://github.com/rshipp/python-nut2.git && \
cd python-nut2 && \
python setup.py install && \
cd .. && \
git clone https://github.com/AdeMiller/webNUT.git && cd webNUT && \
pip install -e .

COPY /docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /app/webNUT

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 6543
