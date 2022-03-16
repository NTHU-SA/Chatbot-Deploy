# Chatbot-Deploy

# How to build your own Chatbot
1. fix Nginx.conf (NTHU-Chatbot)
    - location/api set ip to the one represents host machiine
2. fix mongo-import.sh (Chatbot-Deploy)
    - set $host to the ip that represents host machine
3. fix mongodb.go (NTHU-Chatbot-API)
    - set ip to the one represents host machine
4. Go to this repository and then `docker-compose up`.

# How to build on production environment
1. Export environment variables.
```bash=
export PROJECT_ID=chatbot-dev-344011
export REGION=asia-east1
export CLUSTER=autopilot-cluster-1
export LINE_OFFICIAL_TOKEN=
export LINE_WEBHOOK_STRING=
```
2. run `kubernetes_deploy.sh`
