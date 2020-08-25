# тут указываю какой нужен image https://hub.docker.com/_/node
FROM node:12

# начало приложения, все общение с докером будет начинаться с /app
WORKDIR /app

# копирую в рут имаджа
COPY package*.json ./

RUN npm i

# копирую текущую папку в рут докер образа
COPY . .

# задаю env переменные
ENV PORT=8080

EXPOSE 8080

# тут в отличие от RUN команды пишу подряд каждое слово в кавычках
CMD ["npm", "start"]
