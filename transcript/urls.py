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
   path('ligneTransaction/', views.LigneTransactionDetails.as_view(), name='ligneTransaction-detail'),
   path('scan-produit/',views.scanProduit.as_view(),name='scan-produit'),
   path('finalize-transaction/',views.FinalizeTransaction.as_view(),name='finalize-transaction'),
   path('chiffre_affaire_total/',views.ChiffreAffaires.as_view(),name='chiffre-affaire'),
   path('list_total/',views.ListTotal.as_view(),name='top-vente'),
   path('top-vente/',views.TopVente.as_view(),name='top-vente'),
   path('send-mail/', views.sendMail.as_view(), name='send_mail'),
   path('api-token-auth/', auth_views.obtain_auth_token),
   path('login/',views.login.as_view(),name='login'),
   path('logout/',views.Logout.as_view(),name='logout'),
   path('transaction/',views.TransactionView.as_view(),name='Transaction'),
   path('transaction/<int:pk>/',views.TransactionView.as_view(),name='Transaction'),
   path('nom_prod/<str:code_barre>/',views.Test.as_view(),name='nom_prod'),
   path('reset-transactions/', views.ResetTransactions.as_view(), name='reset-transactions'),
   path('commande/', views.Commande.as_view(), name='commande'),
   path('commande/<int:pk>/', views.Commande.as_view(), name='commande'),
   path('client/', views.ClientApi.as_view(), name='client'),
   path('client/<int:pk>/', views.ClientApi.as_view(), name='client'),
   path('create-stripe-session/', views.CreateStripeCheckoutSession.as_view(), name='create-stripe-session'),
   path('commande/suivi/<str:numero_suivi>/', views.CommandeByNumeroSuivi.as_view(), name='commande_by_numero_suivi'),
   path('benefice/', views.Benefice.as_view(), name='benefice'),
   path('beneficeMois/', views.BeneficeParMois.as_view(), name='beneficeMois'),
   path('beneficeSemaine/', views.BeneficeParSemaine.as_view(), name='beneficeSemaine'),
   
   
   
   
]
