from django.urls import path
from . import views

urlpatterns = [
    
   # path('crud/', views.get, name='cruds'),
   path('users/', views.UsersList.as_view(), name='users-list'),
   path('produits/', views.ProduitList.as_view(), name='produit-list')
]
