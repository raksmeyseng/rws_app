#!/bin/sh

echo "[EXECUTE] flutter build web"
flutter build web

echo "[EXECUTE] firebase deploy"
firebase deploy

echo "[EXECUTE] python3 -m webbrowser  https://eac-app-admin-47662.web.app"
python3 -m webbrowser https://eac-app-admin-47662.web.app

echo "DEPLOYED!!!"
