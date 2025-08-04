import unittest
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../backend')))

from app import app


class FlaskAuthTestCase(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_home(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)

    def test_register_missing_fields(self):
        response = self.app.post('/register', json={})
        self.assertNotEqual(response.status_code, 200)

    def test_login_invalid_user(self):
        response = self.app.post('/login', json={"username": "wrong", "password": "1234"})
        self.assertEqual(response.status_code, 401)

if __name__ == '__main__':
    unittest.main()
