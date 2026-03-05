# JobPortalApp — HR Resume Filter

## Project Structure
```
JobPortalApp/
├── app.py                    ← Flask app entry point
├── seed_data.py              ← Populate DB with test data
├── requirements.txt
├── backend/
│   └── config.py             ← App configuration
├── models/
│   ├── user_model.py
│   ├── employer_model.py
│   ├── candidate_model.py
│   ├── job_model.py
│   ├── resume_model.py
│   └── application_model.py
├── routes/
│   ├── auth_routes.py
│   ├── employer_routes.py
│   ├── candidate_routes.py
│   ├── job_routes.py
│   ├── resume_routes.py
│   └── hr_filter_routes.py   ← ⭐ HR Resume Filter (main feature)
└── static/resumes/           ← Uploaded resume files stored here
```

---

## Setup & Run

```bash
# 1. Create virtual environment
python -m venv venv
venv\Scripts\activate        # Windows
source venv/bin/activate     # Mac/Linux

# 2. Install dependencies
pip install -r requirements.txt

# 3. Seed test data
python seed_data.py

# 4. Run the app
python app.py
```

---

## HR Resume Filter API

### 1. Login as HR
```
POST /api/auth/login
{
  "email": "hr@techcorp.com",
  "password": "password123"
}
```

### 2. Filter Resumes for a Job
```
GET /api/hr/filter/1
```
With filters:
```
GET /api/hr/filter/1?min_score=50&sort_by=score&location=Bangalore
GET /api/hr/filter/1?required_skills=Python,Flask&min_experience=2
GET /api/hr/filter/1?education=Bachelor&per_page=5&page=1
```

### 3. Score One Resume Against a Job
```
GET /api/hr/score/<resume_id>/<job_id>
```

### 4. Shortlist / Reject / Hire a Candidate
```
PATCH /api/hr/application/<application_id>/status
{
  "status": "shortlisted",
  "hr_notes": "Strong Python skills, schedule interview"
}
```
Valid statuses: `applied → reviewed → shortlisted → rejected → hired`

### 5. View All Shortlisted Candidates
```
GET /api/hr/shortlist/<job_id>
```

---

## Scoring System (out of 100)

| Criteria   | Max Score | Logic                                      |
|------------|----------|--------------------------------------------|
| Skills     | 50 pts   | % of required skills matched               |
| Experience | 30 pts   | Full if meets requirement, partial if close |
| Education  | 20 pts   | Mapped: High School → Diploma → Bachelor → Master → PhD |

**Verdict:**
- ≥ 70 → Strong Match
- ≥ 40 → Moderate Match
- < 40 → Weak Match

---

## All API Endpoints

| Method | URL | Description |
|--------|-----|-------------|
| POST | /api/auth/register | Register user |
| POST | /api/auth/login | Login |
| POST | /api/auth/logout | Logout |
| GET | /api/jobs/ | List all jobs |
| POST | /api/jobs/ | Create job (employer/hr) |
| POST | /api/resumes/ | Upload resume (candidate) |
| POST | /api/candidate/apply | Apply to a job |
| GET | /api/hr/filter/<job_id> | **HR filter resumes** |
| GET | /api/hr/score/<resume_id>/<job_id> | **Score one resume** |
| PATCH | /api/hr/application/<id>/status | **Update status** |
| GET | /api/hr/shortlist/<job_id> | **View shortlisted** |
