git clone https://github.com/scriptcamp/kubernetes-jenkins
kubectl create namespace devops-tools
kubectl apply -f serviceAccount.yaml -n  devops-tools
kubectl create -f volume.yaml -n  devops-tools
kubectl apply -f deployment.yaml -n  devops-tools
echo "
apiVersion: v1
kind: Service
metadata:
  name: jenkins-service
  namespace: devops-tools
  annotations:
      prometheus.io/scrape: 'true'
      prometheus.io/path:   /
      prometheus.io/port:   '8080'
spec:
  selector: 
    app: jenkins-server
  type: NodePort  
  ports:
    - port: 8080
      targetPort: 8080
      nodePort: 32000
" > service.yaml
kubectl apply -f service.yaml