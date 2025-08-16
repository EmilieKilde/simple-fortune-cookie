APP_URL="http://localhost:8080"
docker compose -f "docker-compose.yaml" up -d
sleep 10
echo "Connection to $APP_URL test"

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL" || true)
echo $STATUS_CODE
if [ "$STATUS_CODE" = "200" ]; then
   echo "Application reached"
   exit 0
else
    echo "Unreachable"
    exit 1
fi
