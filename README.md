# telegram_bot_example
  Пример телеграм бота для self-hosted paas. 
  Страница бота: https://captain.dev.pp.ru/#/apps/details/telegram-bot-example, сам бот https://t.me/example_test_docker_bot

# Инструкция как сделать приложение как в heroku
1) Создаём ssh ключ для github на сайте https://8gwifi.org/sshfunctions.jsp и запоминаем публичынй и приватный ключи
2) Создаём новое приложение в https://captain.dev.pp.ru
3) На вкладке "Deployment" выбираем "Method 3: Deploy from Github/Bitbucket/Gitlab"
4) Вбиваем ссылку на репозиторий, ветку и приватный ключ
5) Сгенерируется ссылка вида "https://captain.dev.pp.ru/api/v2/user/apps/webhooks/triggerbuild?namespace=captain&token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7InRva2VuVmVyc2lvbiI6IjMxZTEwOTUxLTRkYTktNGUyMC1hN2IxLTFjNjcyNmY3MDU5ZCIsImFwcE5hbWUiOiJ0ZWxlZ3JhbS1ib3QtZXhhbXBsZSIsIm5hbWVzcGFjZSI6ImNhcHRhaW4ifSwiaWF0IjoxNjUwMjUzMDMwfQ.qJczfoQHHwPbOYq2DdKDFXOb9JZGTU7rVhHg04mnzww", копируем её в гитхаб:
   1) Заходим в репозиторий
   2) переходим на вкладку "Settings"
   3) Переходим на подвкладку "Webhooks"
   4) Добавляем webhook (Webhook from your apps page, Content Type: application/json, Secret: , Just the push event.)
6) Даём доступ приложению к репозиторию:
   1) Заходим в репозиторий
   2) Переходим на вкладку "Settings"
   3) Затем на подвкладку "Deploy keys"
   4) Добавляем публичный ключ.
7) На странице приложения добавляем параметры для бота (например токен):
   1) Вкладка "App configs" -> "Environmental Variables "
8) Готово. Теперь после каждого пуша приложение будет обновляться.

# Инструкция по боту
requirements.txt - библиотеки, которые должны быть установлены  
run.sh - скрипт для первичной настройки и запуска бота
app/bot.py - код бота
captain-definition - конфигурационный файл (caprover + docker)  


