#!/bin/bash

#credentials
yc managed-kubernetes cluster get-credentials test-cluster --external --force
#ingress controller
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx && \
helm repo update && \
helm install ingress-nginx ingress-nginx/ingress-nginx
#cert let's encrypt
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.11.1/cert-manager.yaml
