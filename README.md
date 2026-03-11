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
- Theme directory: `wp-content/themes/hello-corp`

初回起動時に `wordpress_setup` サービスが WordPress を自動インストールし、`Hello Corp` テーマを有効化します。
ローカルのテーマファイルは bind mount されるので、`wp-content/themes/hello-corp` を編集するとブラウザ更新で反映されます。
テーマは block theme 構成です。`theme.json`、`templates/*.html`、`parts/*.html`、`style.css` を編集しつつ、管理画面の `Appearance > Editor` からも構造を確認できます。
既存の `db_data` / `wordpress_data` volume が残っている場合は再インストールは行わず、テーマ有効化のみ実行されます。完全に初期状態からやり直すなら `docker compose down -v` を使ってください。

### Stop

```bash
docker compose down
```

DB データと WordPress データは Docker volume に保存されます。完全に消したい場合は `docker compose down -v` を使ってください。
