from django.test import TestCase

# Create your tests here.
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
from .models import Users

class UserDetailTests(APITestCase):
    
    @classmethod
    def setUpTestData(cls):
        # Nous allons créer un utilisateur ici qui sera utilisé dans tous les tests.
        cls.user = Users.objects.create(name='Test User')
        cls.url = reverse('user-detail', args=[cls.user.id])

    def test_get_user_detail(self):
        # Test de la récupération des détails de l'utilisateur
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data['name'], 'Test User')
    
    def test_update_user_detail(self):
        # Test de la mise à jour de l'utilisateur
        updated_data = {'name': 'Updated Name'}
        response = self.client.put(self.url, updated_data)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.user.refresh_from_db()
        self.assertEqual(self.user.name, 'Updated Name')

    # def test_delete_user_detail(self):
    #     # Test de la suppression de l'utilisateur
    #     response = self.client.delete(self.url)
    #     self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
    #     self.assertFalse(Users.objects.filter(pk=self.user.id).exists())