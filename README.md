# Ethiscan Cybersecurity Platform

Ethiscan is an enterprise-grade ethical cybersecurity scanning platform built with FastAPI, Next.js, and Celery.

## Features
- **HTTP/HTTPS Scanning:** Analyzes headers, security configurations, and CMS fingerprinting.
- **SSL/TLS Analysis:** Checks certificate validity, expiry, and cipher strength.
- **Network Scanning:** Detects open ports and gathers service banners.
- **Vulnerability Engine:** Identifies risks based on OWASP and CVE heuristics.
- **Multilingual Dashboard:** Support for English, French, and Spanish.
- **Background Task Queue:** Scalable scan execution via Celery and Redis.

## Quick Start (Local Dev)

### 1. Requirements
- Docker & Docker Compose
- Node.js (for local frontend dev)
- Python 3.10+ (for local backend dev)

### 2. Run with Docker
```bash
docker-compose up --build
```
Access the Dashboard at: `http://localhost:3000`
Access the API Docs at: `http://localhost:8000/docs`

### 3. Manual Setup (No Docker)

**Backend:**
```bash
cd backend
pip install -r requirements.txt
# Set environment variables in .env
uvicorn app.main:app --reload
```

**Celery Worker:**
```bash
cd backend
celery -A app.workers.tasks.celery_app worker --loglevel=info
```

**Frontend:**
```bash
cd frontend
npm install
npm run dev
```

## Architecture
- **Backend:** FastAPI (Async, Pydantic, SQLAlchemy)
- **Frontend:** Next.js, Tailwind CSS, Lucide Icons, i18next
- **Queue:** Celery + Redis
- **Database:** PostgreSQL

## Roadmap
- [ ] PDF Report Generation
- [ ] OAuth2 / SAML Integration
- [ ] Scheduled/Recurring Scans
- [ ] SIEM/Webhook Integration
