# Ethiscan Public Preview Automator
# This script starts ngrok tunnels for both frontend and backend and connects them.

Write-Host "--- Ethiscan Public Preview Setup ---" -ForegroundColor Cyan

# 1. Start Ngrok for Backend (Port 8000) in background
Write-Host "[1/3] Creating Backend Tunnel..." -ForegroundColor Yellow
$backendProcess = Start-Process ngrok -ArgumentList "http 8000 --log=stdout" -PassThru -WindowStyle Hidden
Start-Sleep -Seconds 5

# Get the Backend URL from Ngrok API
try {
    $ngrokApi = Invoke-RestMethod -Uri "http://127.0.0.1:4040/api/tunnels"
    $backendUrl = $ngrokApi.tunnels[0].public_url
    Write-Host "DONE: Backend is live at $backendUrl" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Could not get Ngrok URL. Is ngrok installed and authenticated?" -ForegroundColor Red
    exit
}

# 2. Update Frontend Environment Variable
Write-Host "[2/3] Connecting Frontend to Public Backend..." -ForegroundColor Yellow
$envFilePath = "frontend/.env.local"
"NEXT_PUBLIC_API_URL=$backendUrl/api/v1" | Out-File -FilePath $envFilePath -Encoding utf8
Write-Host "DONE: Frontend configured." -ForegroundColor Green

# 3. Start Ngrok for Frontend (Port 3000)
Write-Host "[3/3] Creating Frontend Tunnel..." -ForegroundColor Yellow
Write-Host "----------------------------------------------------" -ForegroundColor Cyan
Write-Host "YOUR PUBLIC PREVIEW LINK WILL APPEAR BELOW" -ForegroundColor White
Write-Host "----------------------------------------------------" -ForegroundColor Cyan

ngrok http 3000
