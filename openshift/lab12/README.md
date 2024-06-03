# Lab 12: Configuring a MySQL Pod using ConfigMap and Secret
## Objective
The objective of this lab is to set up a MySQL pod within a Kubernetes cluster, configuring it to use a ConfigMap for the database name and user, and a Secret for the passwords. Additionally, resource requests and limits are defined for the pod. Finally, we'll verify the MySQL configuration by accessing the pod.

## Steps
### 1. Create a Namespace
Create a namespace named nti using the following command:
```bash
kubectl create namespace nti
```
### 2. Apply Resource Quota
Apply a resource quota to limit resource usage within the nti namespace. Edit the resource-quota.yaml file to specify CPU and memory limits, and apply it using the following command:
```yml
# resource-quota.yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: nti-resource-quota
  namespace: nti
spec:
  hard:
    cpu: "1"
    memory: 2Gi
    pods: "5"
```
```bash
kubectl apply -f resource-quota.yaml
```
### 3. Create ConfigMap and Secret
Define a ConfigMap (mysql-config) for the MySQL database name and user, and a Secret (mysql-secret) for the passwords. Edit the respective YAML files (mysql-configmap.yaml and mysql-secret.yaml) to set the desired values, then apply them using the following commands:
(don't forget to encrypt your password)
echo -n '123456' | base64.
```bash
echo -n 'your pasword' | base64.
```
```bash
kubectl apply -f mysql-configmap.yaml
kubectl apply -f mysql-secret.yaml
```
### 4. Create MySQL Deployment
Create a Deployment for the MySQL pod (mysql-deployment.yaml). This Deployment specifies the resource requests and limits, as well as the environment variables for database configuration. Apply the Deployment using the following command:

```bash
kubectl apply -f mysql-deployment.yaml
```
### 5. Verify MySQL Configuration
Exec into the MySQL pod to verify the MySQL configuration. Use the following command to access the pod:
```bash
kubectl get pod -n nti
kubectl exec -it <pod_name> -n nti -- /bin/bash
```
![alt text](<screenshots/Screenshot 2024-06-03 132103.png>)