#!/bin/bash
echo "Checking for existing admin users..."

# Check if there are any superusers in the database
sqlite3 /Users/amish/Documents/JobPortalApp/db.sqlite3 "SELECT username, is_superuser FROM users_users WHERE is_superuser = 1;" 2>/dev/null

echo ""
echo "If you see any usernames above, try those in the admin panel."
echo "If no output, there are no superusers in the database."
echo ""
echo "Admin URL: http://127.0.0.1:8001/admin/"
