FROM postgres:10.4

RUn apt update
RUN apt-get install -y wget

RUN wget https://github.com/wal-g/wal-g/releases/download/v0.2.9/wal-g.linux-amd64.tar.gz -O wal-g.linux-amd64.tar.gz

RUN tar -zxvf wal-g.linux-amd64.tar.gz

RUN mv wal-g /bin/wal-g
