# corporate-site-lp

## WordPress local setup

### 1. Create env file

```bash
cp .env.example .env
```

必要に応じて `.env` の値を変更してください。

### 2. Start containers

```bash
docker compose up -d --build
```

### 3. Open WordPress

- Site: http://localhost:8080
- Admin: http://localhost:8080/wp-admin

### Stop

```bash
docker compose down
```

DB データと WordPress データは Docker volume に保存されます。完全に消したい場合は `docker compose down -v` を使ってください。
