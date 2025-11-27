pipeline {
    agent any
    
    environment {
        PROJECT_NAME = 'product-inventory'
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '📥 Checking out code from repository...'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo '🔨 Building Docker images...'
                sh '''
                    docker-compose build --no-cache
                '''
            }
        }
        
        stage('Deploy') {
            steps {
                echo '🚀 Deploying application...'
                sh '''
                    # Stop and remove old containers
                    docker-compose down || true
                    
                    # Start new containers
                    docker-compose up -d
                    
                    # Wait for services to be ready
                    echo "⏳ Waiting for services to start..."
                    sleep 15
                '''
            }
        }
        
        stage('Health Check') {
            steps {
                echo '🏥 Running health checks...'
                sh '''
                    # Check if containers are running
                    echo "Checking container status..."
                    docker-compose ps
                    
                    # Check backend health endpoint
                    echo "Checking backend health..."
                    max_attempts=10
                    attempt=0
                    
                    while [ $attempt -lt $max_attempts ]; do
                        if curl -f http://localhost:5000/health; then
                            echo "✅ Backend is healthy!"
                            break
                        else
                            echo "⏳ Attempt $((attempt+1))/$max_attempts - Backend not ready yet..."
                            sleep 3
                            attempt=$((attempt+1))
                        fi
                    done
                    
                    if [ $attempt -eq $max_attempts ]; then
                        echo "❌ Backend health check failed!"
                        exit 1
                    fi
                    
                    # Check frontend
                    echo "Checking frontend..."
                    if curl -f http://localhost:3000; then
                        echo "✅ Frontend is accessible!"
                    else
                        echo "❌ Frontend check failed!"
                        exit 1
                    fi
                    
                    # Check low-stock endpoint
                    echo "Checking low-stock API endpoint..."
                    if curl -f http://localhost:5000/api/products/low-stock; then
                        echo "✅ Low-stock endpoint is working!"
                    else
                        echo "❌ Low-stock endpoint failed!"
                        exit 1
                    fi
                    
                    echo "✅ All health checks passed!"
                '''
            }
        }
    }
    
    post {
        success {
            echo '✅ Pipeline completed successfully!'
            echo '🌐 Application is running at:'
            echo '   - Frontend: http://localhost:3000'
            echo '   - Backend API: http://localhost:5000/api/products'
            echo '   - Health Check: http://localhost:5000/health'
        }
        failure {
            echo '❌ Pipeline failed!'
            sh 'docker-compose logs'
        }
        always {
            echo '🧹 Cleaning up...'
            sh 'docker system prune -f || true'
        }
    }
}