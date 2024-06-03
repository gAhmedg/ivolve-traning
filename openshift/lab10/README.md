# Lab 10: Network Configuration

This lab demonstrates how to configure network settings in a Kubernetes cluster using Minikube. In this lab, we will build a custom NGINX image, create a deployment and service to expose the NGINX pods, define a network policy to restrict traffic to the NGINX pods, enable the NGINX Ingress controller, create an Ingress resource to route traffic, and access the NGINX service via the Ingress endpoint using a domain name.


## Prerequisites
Before starting this lab, ensure you have the following prerequisites installed and configured:

- [ Minikube ](https://minikube.sigs.k8s.io/docs/)
- [ Docker ](https://www.docker.com/)
- [ kubectl ](https://kubernetes.io/docs/tasks/tools/)




## Steps
### 1- Build Image from Dockerfile and Push to DockerHub:

- Build  the Docker image:

```sh
docker build -t algn48/lab10-nginx .
```
![build](<screenshots/2 build.png>)

- push the Docker image:
```sh
docker push algn48/lab10-nginx
```
![push](<screenshots/3 push.png>)

### 2- Create a Deployment Using the Custom NGINX Image:

- Apply the deployment:

```sh
kubectl apply -f deployment.yaml
```
### 3 -Create a Service to Expose the Deployment:

- Apply the service:

```sh
kubectl apply -f service.yaml
```
### 4- Define a Network Policy:

- Apply the network policy:

```sh
kubectl apply -f networkpolicy.yaml
```
### 5- Enable NGINX Ingress Controller:

- Enable NGINX Ingress Controller:

```sh
minikube addons enable ingress
```
### 6- Create an Ingress Resource:

- Apply the ingress:

```sh
kubectl apply -f ingress.yaml
```
### 7- Update /etc/hosts to Map the Domain to the Minikube IP Address:

- Update /etc/hosts file (on your local machine) to map the domain to the Minikube IP address:

```php
<Minikube-IP> yourdomain.com
```
![alt text](<screenshots/minikube ip.png>)
### 8- Access the Custom NGINX Service via the Ingress Endpoint Using the Domain Name:

- Open a web browser and navigate to http://gom3a.local

![alt text](<screenshots/gom3a.local>)

## Cleanup
After completing the lab, you can clean up the resources by deleting the Kubernetes objects:

```sh
kubectl delete deployment nginx-deployment
kubectl delete service nginx-service
kubectl delete networkpolicy nginx-network-policy
kubectl delete ingress nginx-ingress
```
## Conclusion
Congratulations! You have successfully configured network settings in a Kubernetes cluster using Minikube. This lab demonstrates the essential steps required to deploy and expose a custom NGINX service securely within a Kubernetes environment.