FROM node:20-alpine
WORKDIR /app
COPY ./apps-calculator /app
EXPOSE 3000
RUN npm install -g http-server
CMD ["http-server", "-p", "3000"]
