FROM nikolaik/python-nodejs:python3.8-nodejs12 AS builder

ENV NODE_WORKDIR /app
WORKDIR $NODE_WORKDIR

ADD . $NODE_WORKDIR

# Tambahkan langkah untuk menambahkan kunci GPG Yarn
RUN wget -qO - https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg

# Perbarui repositori Yarn dengan kunci yang baru
RUN echo "deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y build-essential gcc wget git libvips && rm -rf /var/lib/apt/lists/*

# Instalasi canvas dan paket npm lainnya
RUN npm install canvas@2.6.1 && npm install # TODO: canvas crashes if installed via npm install from package.json
