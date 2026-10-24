# books2-infra

Локальные Docker и nginx для приложения `books2-yii`. PHP в этом репозитории нет: код монтируется из соседнего каталога `../books2-yii`.

## Что поднимается

- `books-web` — nginx и PHP 8.3-FPM, порт 80
- `books-mysql` — MySQL 8, база `books`, пользователь `books`

Сайты:

- `http://books.local` — публичный фронт, корень `frontend/web`
- `http://api.books.local` — API, корень `api/web`
- `http://admin.books.local` — админка, корень `backend/web`

В `C:\Windows\System32\drivers\etc\hosts`:

```
127.0.0.1 books.local api.books.local admin.books.local
```

## Запуск

Рядом с этим каталогом должен лежать `books2-yii` (следующий шаг). Пока его нет, nginx стартует, а сайты отвечают ошибкой «каталог не найден».

```bash
cp .env.example .env
docker compose up -d --build
```

Пароли локальной базы задаются в `.env`. Этот файл не коммитится.
