from django.urls import path
from . import views
from rest_framework.authtoken import views as auth_views


urlpatterns = [
    
   # path('crud/', views.get, name='cruds'),
   path('users/', views.UsersList.as_view(), name='users-list'),
   path('users/<int:pk>/', views.UserDetail.as_view(), name='user-detail'),
   path('create/',views.UsersCreate.as_view(),name='users-create'),
   path('produits/', views.ProduitList.as_view(), name='produit-list'),
   path('create_produits/',views.ProduitCreate.as_view(),name='produit-create'),
   path('produits/<int:pk>/', views.ProduitDetails.as_view(), name='produit-detail'),
   path('fournisseur/', views.FournisseurList.as_view(), name='fournisseur-list'),
   path('create_fournisseur/',views.FournisseurCreate.as_view(),name='fournisseur-create'),
   path('fournisseur/<int:pk>/', views.FournisseurDetails.as_view(), name='fournisseur-detail'),
   path('ligneTransaction/<int:pk>/', views.LigneTransactionDetails.as_view(), name='ligneTransaction-detail'),
   path('scan-produit/',views.scanProduit.as_view(),name='scan-produit'),
   path('finalize-transaction/',views.FinalizeTransaction.as_view(),name='finalize-transaction'),
   path('chiffre_affaire_total/',views.ChiffreAffaires.as_view(),name='chiffre-affaire'),
   path('list_total/',views.ListTotal.as_view(),name='top-vente'),
   path('top-vente/',views.TopVente.as_view(),name='top-vente'),
   path('send-mail/', views.sendMail.as_view(), name='send_mail'),
   path('api-token-auth/', auth_views.obtain_auth_token),
   path('login/',views.login.as_view(),name='login'),
   path('logout/',views.Logout.as_view(),name='logout'),
   path('nom_prod/<str:code_barre>/',views.Test.as_view(),name='nom_prod'),
   
   
]
