#!/usr/bin/env python3
import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'jobportal.settings')
django.setup()

from django.contrib.auth import get_user_model

User = get_user_model()

# Check if admin user exists
if not User.objects.filter(username='admin').exists():
    # Create superuser
    admin = User.objects.create_superuser(
        username='admin',
        email='admin@example.com',
        password='admin123',
        role='admin'  # Add role if needed
    )
    print('✅ Admin user created successfully!')
    print('🔑 Username: admin')
    print('🔑 Password: admin123')
    print('🌐 Admin URL: http://127.0.0.1:8001/admin/')
else:
    print('ℹ️ Admin user already exists')
    print('🔑 Username: admin')
    print('🔑 Password: admin123 (try this, or your existing password)')
