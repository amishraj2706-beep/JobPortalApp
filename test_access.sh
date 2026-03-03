#!/bin/bash

echo "Checking Django admin access..."

# Test if admin URL responds
echo "Testing admin URL accessibility..."
curl -s -w "HTTP Status: %{http_code}\n" http://127.0.0.1:8001/admin/ -o /dev/null

echo ""
echo "If you see HTTP Status: 200, admin is accessible"
echo "If you see HTTP Status: 302, admin is redirecting (need login)"
echo "If you see connection refused, server may not be running on that port"

echo ""
echo "Try these URLs in your browser:"
echo "1. Admin: http://127.0.0.1:8001/admin/"
echo "2. Messaging: http://127.0.0.1:8001/messaging/"
echo "3. Users API: http://127.0.0.1:8001/api/users/login/"
