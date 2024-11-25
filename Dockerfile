FROM zhouzhipeng/play-cache

WORKDIR /app
COPY . .

ARG PACKAGE=plugin-openai

RUN cargo build --locked  --release -p ${PACKAGE}