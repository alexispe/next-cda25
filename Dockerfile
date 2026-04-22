FROM node:24-alpine3.22

COPY . /app

WORKDIR /app

RUN npm install
RUN npm run build

EXPOSE 3000

COPY ./docker/next/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["npm", "run", "start"]
