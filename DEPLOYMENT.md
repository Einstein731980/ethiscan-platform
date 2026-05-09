# Ethiscan Deployment Checklist

## 1. Render.com (Backend API)
- **Repo:** `Einstein731980/ethiscan-platform`
- **Root Directory:** `backend`
- **Build Command:** `pip install -r requirements.txt`
- **Start Command:** `python -m uvicorn app.main:app --host 0.0.0.0 --port 10000`
- **Environment Variables:**
  - `DATABASE_URL`: (Your Supabase URI)
  - `SECRET_KEY`: `ethiscan_secure_v1_2026`

## 2. Vercel.com (Frontend UI)
- **Repo:** `Einstein731980/ethiscan-platform`
- **Root Directory:** `frontend`
- **Framework Preset:** `Next.js`
- **Environment Variables:**
  - `NEXT_PUBLIC_API_URL`: `https://[YOUR-RENDER-URL].onrender.com/api/v1`

## 3. Post-Deployment Verification
1. Visit `https://ethiscan-app.vercel.app/login`
2. Create an account.
3. Launch a scan on a test domain (e.g., `google.com`).
4. Watch the status change from PENDING -> RUNNING -> COMPLETED.
