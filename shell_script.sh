#!/bin/bash

echo
echo "Create necessary images"
echo
sudo docker build -t docker-registry:5000/flask_webapp .
sudo docker push docker-registry:5000/flask_webapp

echo
echo "Create Kubernetes Sealed secret from file"
echo
kubeseal --fetch-cert > public-key-cert.pem
kubeseal --format=yaml --cert=public-key-cert.pem < db-password-secret-unsealed.yaml > db-password-secret.yaml
kubectl apply -f db-password-secret.yaml

echo
echo "Create database deployment and service"
echo
kubectl apply -f db-deployment.yaml
kubectl apply -f db-service.yaml

echo
echo "Create webapp deployment and service"
echo
kubectl apply -f webapp-deployment.yaml
kubectl apply -f webapp-service.yaml

echo
echo "Check Kubernetes configuration"
echo
sleep 5
echo
echo "-- Secrets"
echo
kubectl get secrets
echo
echo "-- Pods"
echo
kubectl get pods
echo
echo "-- Services"
echo
kubectl get services

echo
echo "ALL DONE"
echo



