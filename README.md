## Feedback App + CI/CD Manual Approval

### 1. Teknologi yang Digunakan:
- Python (Flask)
- Docker
- Jenkins
- Git

### 2. Struktur Jenkins Pipeline:

- `Clone Repo`
- `Build Docker Image`
- `Run Pytest`
- `Manual QA Approval`
- `Deploy ke Container`

### 3. Cara Akses Aplikasi
- Buka browser → http://192.168.69.79:5000

### 4. Notes:
- Port 8080 dipake Jenkins, jadi deploy app di port 5000
- QA approval dijalankan manual karena step input Jenkins tidak merespons
