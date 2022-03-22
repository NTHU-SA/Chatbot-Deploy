# kubectl delete --all pods

rm -rf repos
mkdir repos
cd repos

git clone https://github.com/NTHU-SA/NTHU-Chatbot-API.git
git clone https://github.com/NTHU-SA/NTHU-Chatbot.git
git clone https://github.com/NTHU-SA/NTHU-Campus-Agent-LINE-Flask.git

gcloud container clusters get-credentials ${CLUSTER} --zone ${REGION}

# Run mongodb
kubectl apply -f NTHU-Chatbot-API/gke/mongo.yaml
kubectl apply -f NTHU-Chatbot-API/gke/mongo-service.yaml
kubectl apply -f NTHU-Chatbot-API/gke/mongo-pv-claim.yaml

# Run Go API
export MONGOIP=$(kubectl get service --all-namespaces | grep mongo-service | grep -Po "[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}")
echo "--------"
echo "MONGO is running at ${MONGOIP}"
echo "--------"

cat NTHU-Chatbot-API/database/mongodb.go | envsubst > NTHU-Chatbot-API/database/mongodb.go.subst
mv NTHU-Chatbot-API/database/mongodb.go.subst NTHU-Chatbot-API/database/mongodb.go

cd NTHU-Chatbot-API
cat Dockerfile | envsubst | docker build -t gcr.io/${PROJECT_ID}/nthu-chatbot-api .
cd ..

docker push gcr.io/${PROJECT_ID}/nthu-chatbot-api

cat NTHU-Chatbot-API/gke/gin.yaml | envsubst > NTHU-Chatbot-API/gke/gin.yaml.subst 
kubectl apply -f NTHU-Chatbot-API/gke/gin.yaml.subst
kubectl apply -f NTHU-Chatbot-API/gke/gin-service.yaml

# Run Nginx-Cleint
export GINIP=$(kubectl get service --all-namespaces | grep gin-service | grep -Po "[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}\.[0-9]{1,}")
echo "--------"
echo "GIN is running at ${GINIP}"
echo "--------"

cat NTHU-Chatbot/nginx/nginx.conf | envsubst '${GINIP}' > NTHU-Chatbot/nginx/nginx.conf.subst
mv NTHU-Chatbot/nginx/nginx.conf.subst NTHU-Chatbot/nginx/nginx.conf

cd NTHU-Chatbot
cat Dockerfile | envsubst | docker build -t gcr.io/${PROJECT_ID}/nthu-chatbot-client .
cd ..

docker push gcr.io/${PROJECT_ID}/nthu-chatbot-client

cat NTHU-Chatbot/gke/nginx.yaml | envsubst > NTHU-Chatbot/gke/nginx.yaml.subst 
kubectl apply -f NTHU-Chatbot/gke/nginx.yaml.subst
kubectl apply -f NTHU-Chatbot/gke/nginx-service.yaml

# Line Flask
cat NTHU-Campus-Agent-LINE-Flask/app/linebot/__init__.py | envsubst > NTHU-Campus-Agent-LINE-Flask/app/linebot/__init__.py.subst
mv NTHU-Campus-Agent-LINE-Flask/app/linebot/__init__.py.subst NTHU-Campus-Agent-LINE-Flask/app/linebot/__init__.py

cat NTHU-Campus-Agent-LINE-Flask/API/baseAPI.py | envsubst > NTHU-Campus-Agent-LINE-Flask/API/baseAPI.py.subst
mv NTHU-Campus-Agent-LINE-Flask/API/baseAPI.py.subst NTHU-Campus-Agent-LINE-Flask/API/baseAPI.py

cd NTHU-Campus-Agent-LINE-Flask
cat Dockerfile | envsubst | docker build -t gcr.io/${PROJECT_ID}/nthu-line-flask .
cd ..

docker push gcr.io/${PROJECT_ID}/nthu-line-flask

cat NTHU-Campus-Agent-LINE-Flask/gke/chatbot.yaml | envsubst > NTHU-Campus-Agent-LINE-Flask/gke/chatbot.yaml.subst 
kubectl apply -f NTHU-Campus-Agent-LINE-Flask/gke/chatbot.yaml.subst
kubectl apply -f NTHU-Campus-Agent-LINE-Flask/gke/chatbot-service.yaml
kubectl apply -f NTHU-Campus-Agent-LINE-Flask/gke/chatbot-ingress.yaml

# Import mongo files
kubectl port-forward service/mongo-service 27017:27017 &> /dev/null &
cd ..
./mongo-import.sh
