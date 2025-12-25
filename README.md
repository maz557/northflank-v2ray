# V2Ray on Northflank

این پروژه یک سرور V2Ray ساده با WebSocket + TLS است که روی Northflank اجرا می‌شود.

## مراحل دیپلوی
1. این ریپازیتوری را در GitHub قرار دهید.
2. در Northflank یک سرویس جدید بسازید و ریپازیتوری را وصل کنید.
3. پورت 443 را در بخش Networking باز کنید.
4. پس از دیپلوی، آدرس عمومی شما چیزی شبیه زیر خواهد بود:
   ```
   https://your-service.northflank.app/ray
   ```

## ساخت UUID
برای ایجاد UUID می‌توانید از دستور زیر در لینوکس یا مک استفاده کنید:
```
uuidgen
```
یا در ویندوز PowerShell:
```
[guid]::NewGuid()
```
همچنین می‌توانید از ابزارهای آنلاین تولید UUID استفاده کنید. مقدار تولید شده را در فایل `config.json` جایگزین کنید.

## تنظیمات کلاینت (V2rayN)
- Address: دامنه عمومی Northflank (مثلاً your-service.northflank.app)
- Port: 443
- UUID: همان مقدار در config.json
- Transport: WebSocket
- Path: /ray
- TLS: فعال

## ساخت لینک اشتراک vmess://
فرمت لینک اشتراک به شکل زیر است:
```
vmess://BASE64_JSON
```

نمونه JSON برای اشتراک:
```json
{
  "v": "2",
  "ps": "Northflank-V2Ray",
  "add": "your-service.northflank.app",
  "port": "443",
  "id": "ec38f1c7-25d8-4128-8c4d-140573c6f584",
  "aid": "0",
  "net": "ws",
  "path": "/ray",
  "tls": "tls",
  "type": "none",
  "host": ""
}
```

برای ساخت لینک:
1. این JSON را در یک فایل ذخیره کنید.
2. کل محتوای JSON را با Base64 رمزگذاری کنید.
3. در ابتدای آن `vmess://` اضافه کنید.

مثال:
```
vmess://eyJ2IjoiMiIsInBzIjoiTm9ydGhmbGFuay1WMlJheSIsImFkZCI6InlvdXItc2VydmljZS5ub3J0aGZsYW5rLmFwcCIsInBvcnQiOiI0NDMiLCJpZCI6IjEyMzQ1Ni03ODkwLWFhYmMtZGVmZy0xMjM0NTY3ODkwYWFiYyIsImFpZCI6IjAiLCJuZXQiOiJ3cyIsInBhdGgiOiIvcmF5IiwidGxzIjoidGxzIiwidHlwZSI6Im5vbmUiLCJob3N0IjoiIn0=
```

این لینک را می‌توانید مستقیم در V2rayN وارد کنید.