# استفاده از ایمیج رسمی V2Ray
FROM v2fly/v2ray:latest

# کپی کردن فایل کانفیگ به داخل کانتینر
COPY config.json /etc/v2ray/config.json

# باز کردن پورت 443 برای TLS/WebSocket
EXPOSE 443

# اجرای V2Ray با کانفیگ
CMD ["v2ray", "-config=/etc/v2ray/config.json"]