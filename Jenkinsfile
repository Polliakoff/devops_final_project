pipeline {
    agent any

    stages {
        stage('Create necessary images') {
            steps {
                echo '=========================Create necessary images========================='
                sh 'docker build -t docker-registry:5000/flask_webapp .'
                sh 'docker push docker-registry:5000/flask_webapp'
            }
        }
        stage('Create Kubernetes Sealed secret from file'){
            steps {
                echo '=========================Create Kubernetes Sealed secret from file========================='
                sh 'kubeseal --fetch-cert > public-key-cert.pem'
                sh 'kubeseal --format=yaml --cert=public-key-cert.pem < db-password-secret-unsealed.yaml > db-password-secret.yaml'
                sh 'kubectl apply -f db-password-secret.yaml'
            }
        }
        stage('Create webapp deployment and service'){
            steps {
                echo '=========================Create webapp deployment and service========================='
                sh 'kubectl apply -f webapp-deployment.yaml'
                sh 'kubectl apply -f webapp-service.yaml'
            }
        }
        stage('Create database deployment and service'){
            steps {
                echo '=========================Create database deployment and service========================='
                sh 'kubectl apply -f db-deployment.yaml'
                sh 'kubectl apply -f db-service.yaml'
            }
        }       
        stage('Check Kubernetes configuration'){
            steps {
                echo '=========================Check Kubernetes configuration========================='
                sh 'sleep 5'
                echo '=========================secrets========================='
                sh 'kubectl get secrets -o wide'
                echo '=========================pods========================='
                sh 'kubectl get pods -o wide'
                echo '=========================services========================='
                sh 'kubectl get services -o wide'
                echo '=========================ALL DONE========================='
            }
        }    
    }
}
