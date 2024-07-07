from django.urls import path
from . import views

urlpatterns = [
    
   # path('crud/', views.get, name='cruds'),
   path('users/', views.UsersList.as_view(), name='users-list'),
   path('users/<int:pk>/', views.UserDetail.as_view(), name='user-detail'),
   path('create/',views.UsersCreate.as_view(),name='users-create'),
   path('produits/', views.ProduitList.as_view(), name='produit-list'),
]
