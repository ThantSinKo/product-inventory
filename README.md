# 📦 Product Inventory - Full Stack Application

A complete full-stack product inventory management system with Docker containerization and Jenkins CI/CD automation.

## 🏗️ Architecture

- **Frontend**: HTML/CSS/JavaScript (Nginx)
- **Backend**: Node.js + Express
- **Database**: PostgreSQL
- **Containerization**: Docker + Docker Compose
- **CI/CD**: Jenkins Pipeline

## 📁 Project Structure

```
product-inventory/
├── backend/
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
├── frontend/
│   ├── index.html
│   ├── nginx.conf
│   └── Dockerfile
├── database/
│   └── init.sql
├── docker-compose.yml
├── Jenkinsfile
├── .env.example
├── .gitignore
└── README.md
```

## 🚀 Features

- ✅ Full CRUD operations for products
- ✅ Real-time inventory tracking
- ✅ Low stock alerts
- ✅ Category filtering
- ✅ Inventory value calculation
- ✅ Responsive UI
- ✅ Health check endpoints
- ✅ Automated CI/CD pipeline

## 🛠️ Setup Instructions

### 1. Prerequisites

- Docker & Docker Compose installed
- Jenkins installed (optional for CI/CD)
- Git installed

### 2. Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/product-inventory.git
cd product-inventory
```

### 3. Configure Environment

```bash
cp .env.example .env
# Edit .env with your database credentials
nano .env
```

### 4. Run with Docker Compose

```bash
# Build and start all services
docker-compose up -d

# Check status
docker-compose ps

# View logs
docker-compose logs -f
```

### 5. Access Application

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000/api/products
- **Health Check**: http://localhost:5000/health

## 🔄 CI/CD with Jenkins

### Setup Pipeline

1. Open Jenkins at http://localhost:8080
2. Create new Pipeline job
3. Configure:
   - Definition: Pipeline script from SCM
   - SCM: Git
   - Repository URL: Your GitHub repo
   - Script Path: Jenkinsfile
4. Build Triggers: Poll SCM with `H/5 * * * *`

### Pipeline Stages

1. **Checkout** - Pull latest code
2. **Build** - Build Docker images
3. **Deploy** - Deploy containers
4. **Health Check** - Verify services are running

## 📊 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/products` | Get all products |
| GET | `/api/products/:id` | Get single product |
| GET | `/api/products/low-stock` | Get products with quantity < 10 |
| POST | `/api/products` | Create new product |
| PUT | `/api/products/:id` | Update product |
| DELETE | `/api/products/:id` | Delete product |
| GET | `/health` | Health check |

## 🗄️ Database Schema

```sql
products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  quantity INTEGER,
  price DECIMAL(10, 2),
  category VARCHAR(100),
  created_at TIMESTAMP
)
```

## 🧪 Testing

```bash
# Test backend health
curl http://localhost:5000/health

# Test API
curl http://localhost:5000/api/products

# Test low stock
curl http://localhost:5000/api/products/low-stock
```

## 🐳 Docker Commands

```bash
# Start services
docker-compose up -d

# Stop services
docker-compose down

# Rebuild services
docker-compose build --no-cache

# View logs
docker-compose logs -f backend

# Execute commands in container
docker-compose exec backend sh
```

## 🔧 Troubleshooting

### Database connection issues
```bash
docker-compose logs db
docker-compose restart db
```

### Backend not starting
```bash
docker-compose logs backend
# Check .env file configuration
```

### Frontend can't connect to backend
- Ensure backend is running on port 5000
- Check CORS configuration
- Verify API_URL in frontend code

## 📝 Development

### Add new product categories
Edit `frontend/index.html` - Update category dropdown

### Modify database schema
Edit `database/init.sql` - Add migrations

### Update API endpoints
Edit `backend/server.js` - Add new routes

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

This project is for educational purposes.

## 👨‍💻 Author

Your Name

## 🙏 Acknowledgments

- Node.js community
- Docker documentation
- Jenkins documentation