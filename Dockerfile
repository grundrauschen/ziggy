FROM routinator

WORKDIR /tmp/ziggy

USER root

RUN apk add -U --no-cache git python3 build-base openssl
COPY . /opt/ziggy
RUN pip3 install dateutils requests
RUN git clone https://github.com/wolfcw/libfaketime.git && cd libfaketime && make && make install

RUN routinator init --accept-arin-rpa
RUN mkdir /tmp/ziggy-out

WORKDIR /tmp/ziggy-out

ENTRYPOINT ["/opt/ziggy/ziggy.py"]


