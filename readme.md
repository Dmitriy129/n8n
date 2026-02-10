Как запустить
1) Создай .env:
cp .env.example .env
Заполни DOMAIN и EMAIL
2) Подними сервисы:
docker compose up -d nginx n8n
3) Получи первый сертификат:
docker compose run --rm certbot certonly --webroot -w /var/www/certbot -d "$DOMAIN" --email "$EMAIL" --agree-tos --no-eff-email
4) Перезапусти nginx:
docker compose restart nginx
SSL‑обновление
certbot контейнер уже крутит renew каждые 12 часов.


https://api.telegram.org/bot8465858119:AAE9Of95pteIT4V0BGG8GDgbA87HFvqrHvc/deleteWebhook
https://api.telegram.org/bot8465858119:AAE9Of95pteIT4V0BGG8GDgbA87HFvqrHvc/setWebhook
https://api.telegram.org/bot8465858119:AAE9Of95pteIT4V0BGG8GDgbA87HFvqrHvc/setWebhook?url=https://be471e6f-eac7-48cb-8d9f-cdf2f1721434-e1.tunnel4.com/webhook-test/a15e5b59-8e26-41c3-8e40-8da7cc5f94f5
xtunnel - проброс порта наружу


https://be471e6f-eac7-48cb-8d9f-cdf2f1721434-e1.tunnel4.com/workflow/kCTBlvH60VrGLJWkOQRC6/76696a
http://localhost:5678/webhook-test/a15e5b59-8e26-41c3-8e40-8da7cc5f94f5
https://be471e6f-eac7-48cb-8d9f-cdf2f1721434-e1.tunnel4.com/webhook-test/a15e5b59-8e26-41c3-8e40-8da7cc5f94f5