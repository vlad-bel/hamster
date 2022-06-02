FROM cirrusci/flutter:stable AS builder
WORKDIR /opt/app
COPY . .
RUN flutter build web -t lib/main_development.dart --release --web-renderer html

FROM nginx:alpine
COPY --from=builder /opt/app/build/web /usr/share/nginx/html
COPY ./default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
