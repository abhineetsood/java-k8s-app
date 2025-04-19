# Java Kubernetes Application

This project is a simple Java application designed to be deployed in a Kubernetes cluster hosted in Amazon EKS. 

## Project Structure

```
java-k8s-app
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── example
│   │   │           └── App.java
│   │   └── resources
│   │       └── application.properties
│   └── test
│       └── java
│           └── com
│               └── example
│                   └── AppTest.java
├── k8s
│   ├── deployment.yaml
│   ├── service.yaml
│   └── configmap.yaml
├── Dockerfile
├── pom.xml
└── README.md
```

## Prerequisites

- Java 11 or higher
- Maven
- Docker
- Kubernetes cluster (Amazon EKS)

## Setup Instructions

1. **Clone the repository:**
   ```
   git clone <repository-url>
   cd java-k8s-app
   ```

2. **Build the application:**
   ```
   mvn clean package
   ```

3. **Build the Docker image:**
   ```
   docker build -t java-k8s-app .
   ```

4. **Deploy to Kubernetes:**
   - Apply the ConfigMap:
     ```
     kubectl apply -f k8s/configmap.yaml
     ```
   - Deploy the application:
     ```
     kubectl apply -f k8s/deployment.yaml
     ```
   - Expose the application:
     ```
     kubectl apply -f k8s/service.yaml
     ```

## Usage

After deploying the application, you can access it via the service created in Kubernetes. Use the following command to get the service details:

```
kubectl get services
```

## Testing

To run the unit tests, use the following command:

```
mvn test
```

## License

This project is licensed under the MIT License.