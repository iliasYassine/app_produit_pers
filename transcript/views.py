# views.py

from decimal import Decimal
from itertools import count
from .models.personne import Users
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.core import serializers
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Users,Produit,Fournisseur,LigneTransaction,Transaction
from .serializers import FournisseurSerializer, UsersSerializer,ProduitSerializer,TransactionSerializer,LigneTransactionSerializer
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView
from django.shortcuts import get_object_or_404
from django.db import transaction as db_transaction
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.permissions import AllowAny
from django.shortcuts import get_object_or_404
from django.db import transaction as db_transaction
from .models import Produit, Transaction, LigneTransaction  
from .serializers import LigneTransactionSerializer
from django.db.models import Sum
from django.db.models import Count
from django.core.mail import send_mail
from django.db.models import F
from rest_framework.test import APIClient
from django.contrib.auth import authenticate, login
from rest_framework.authtoken.models import Token    
from django.contrib.auth.models import User
from django.contrib.auth import logout


class UsersList(APIView):
    def get(self, request, format=None):
        users = Users.objects.all()
        serializer = UsersSerializer(users, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    
#@method_decorator(csrf_exempt, name='dispatch')    
class UsersCreate(APIView):
    permission_classes = [AllowAny]
    def post(self,request,format=None):
        serializers=UsersSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data ,status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
class UserDetail(APIView):
    # GET, PUT, DELETE /users/<id>/
    def get(self, request, pk, format=None):
        user = get_object_or_404(Users, pk=pk)
        serializer = UsersSerializer(user)
        return Response(serializer.data)
    
    def put(self, request, pk, format=None):
        user = get_object_or_404(Users, pk=pk)
        serializer = UsersSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk, format=None):
        user = get_object_or_404(Users, pk=pk)
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)    


class ProduitList(APIView):
    def get(self, request, format=None):
        produit = Produit.objects.all()
        serializer = ProduitSerializer(produit, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)    
    
class ProduitCreate(APIView):
    permission_classes = [AllowAny]
    def post(self,request,format=None):
        serializers=ProduitSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data ,status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)
    
  
class ProduitDetails(APIView):
    # GET, PUT, DELETE /users/<id>/
    def get(self, request, pk, format=None):
        produit = get_object_or_404(Produit, pk=pk)
        serializer = ProduitSerializer(produit)
        return Response(serializer.data)
    
    def put(self, request, pk, format=None):
        produit = get_object_or_404(Produit, pk=pk)
        serializer = ProduitSerializer(produit, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk, format=None):
        produit = get_object_or_404(Produit, pk=pk)
        produit.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)  



    
###########Fournisseur##############    
class FournisseurList(APIView):
    def get(self, request, format=None):
        fournisseur = Fournisseur.objects.all()
        serializer = FournisseurSerializer(fournisseur, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)    
    
class FournisseurCreate(APIView):
    permission_classes = [AllowAny]
    def post(self,request,format=None):
        serializers=FournisseurSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data ,status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)
    
  
class FournisseurDetails(APIView):
    # GET, PUT, DELETE /users/<id>/
    def get(self, request, pk, format=None):
        fournisseur = get_object_or_404(Fournisseur, pk=pk)
        serializer = FournisseurSerializer(fournisseur)
        return Response(serializer.data)
    
    def put(self, request, pk, format=None):
        fourniseur = get_object_or_404(Fournisseur, pk=pk)
        serializer = FournisseurSerializer(fourniseur, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk, format=None):
        fournisseur = get_object_or_404(Produit, pk=pk)
        fournisseur.delete()
        return Response(status=status.HTTP_204_NO_CONTENT) 
    
    
class LigneTransactionDetails(APIView):
    # GET, PUT, DELETE /users/<id>/
    def get(self, request, pk, format=None):
        lignTransac = get_object_or_404(LigneTransaction, pk=pk)
        serializer = LigneTransactionSerializer(lignTransac)
        return Response(serializer.data)
    
    def put(self, request, pk, format=None):
        lignTransac = get_object_or_404(LigneTransaction, pk=pk)
        serializer = TransactionSerializer(lignTransac, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk, format=None):
        lignTransac = get_object_or_404(LigneTransaction, pk=pk)
        lignTransac.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)  
    
class  scanProduit(APIView):
    permission_classes = [AllowAny]
    
    def post(self,request,format=None):
        code_barre =request.data.get('codeBarre')
        if not code_barre:
            return Response({'erreur': 'Un code-barre est requis.'}, status=status.HTTP_400_BAD_REQUEST) 
             
                
        with db_transaction.atomic():
            produit=get_object_or_404(Produit,codeBarre=code_barre)
            if produit.qte <= 0:
                return Response({'erreur': 'Stock insuffisant pour le produit demandé.'}, status=status.HTTP_400_BAD_REQUEST)
            #on gere la transaction mtn qu'on a le produit
            transaction_id = request.session.get('transaction_id', None)
            if not transaction_id:
                transaction = Transaction()
                transaction.save()
                request.session['transaction_id'] = transaction.id
            else:
                transaction = Transaction.objects.get(id=transaction_id)
                
            # Gestion de la ligne de transaction
            ligne_transaction, created = LigneTransaction.objects.get_or_create(
                transaction=transaction,
                produit=produit,
                defaults={'quantite': 1, 'prix_unitaire': produit.prixVente}
            )
            if not created:
                ligne_transaction.quantite += 1
                ligne_transaction.total = ligne_transaction.quantite * ligne_transaction.prix_unitaire
                ligne_transaction.save()
            
            
            # mise a jour total dans transaction
            # Mise à jour du total de la transaction
            transaction_total = transaction.lignes.all().aggregate(
            total_sum=Sum('total')
            )['total_sum'] or 0
            transaction.total = transaction_total  
            transaction.save()    
                   


            # Mise à jour du stock du produit
            produit.qte -= 1
            produit.save()

            # Sérialisation de la ligne de transaction pour la réponse
            ligne_serializer = LigneTransactionSerializer(ligne_transaction)
            return Response(ligne_serializer.data, status=status.HTTP_201_CREATED)                  
        
class FinalizeTransaction(APIView):
    permission_classes = [AllowAny]

    def post(self, request, *args, **kwargs):
        transaction_id = request.session.get('transaction_id', None)
        if not transaction_id:
            return Response({'erreur': 'Aucune transaction en cours.'}, status=status.HTTP_400_BAD_REQUEST)

        with db_transaction.atomic():
            transaction = get_object_or_404(Transaction, id=transaction_id)
            # Vous implémenterez ici votre logique de finalisation de transaction
            # Par exemple, appliquer des remises, calculer les taxes, confirmer le paiement, etc.
             # Calculez le total en additionnant les totaux de toutes les ligne_transactions liées
            transaction_total = LigneTransaction.objects.filter(transaction=transaction).aggregate(Sum('total'))['total__sum'] or 0
            transaction.total = transaction_total
            
            
            transaction.save()  # Enregistrer les modifications finales de la transaction
            request.session.pop('transaction_id', None)  # Nettoyer la session après finalisation

            # Sérialiser la transaction pour l'envoyer en réponse
            transaction_serializer = TransactionSerializer(transaction)
            return Response(transaction_serializer.data, status=status.HTTP_200_OK)        
        
        
         

class ChiffreAffaires(APIView):
    permission_classes = [AllowAny]

    def get(self, request, format=None):
        chiffre_affaire_total = Transaction.objects.aggregate(chiffre_affaire_total=Sum('total'))['chiffre_affaire_total'] or 0
        return Response({'chiffre_affaires': chiffre_affaire_total})
    
class ListTotal(APIView):
    
    def get(self,request,*args, **kwargs):
        affiche=Transaction.objects.values_list('total',flat=True)
        
        # faire une liste
        total_list=list(affiche)
        
        return Response({'top_vente': total_list}, status=200)    
    
    
class TopVente(APIView):
    permission_classes = [AllowAny]
    def get(self,request,*args, **kwargs):
        topVente=LigneTransaction.objects.values('produit_id').annotate(count_id=Count('produit_id')).order_by('-count_id').first()
        nom_produit=Produit.objects.get(id=topVente['produit_id']).nomProd
        return Response({'top_vente': topVente,'nomProd':nom_produit}, status=200)     
    
    
class sendMail(APIView):
    permission_classes=[AllowAny]
    def get(self,request):
        produits = Produit.objects.filter(qte__lte=F('qteMin'))
        for produit in produits:      

            send_mail(
                    'Alerte produit min atteint a recommander',
                    f'vous avez atteint le min penser a commander ce produit: {produit.nomProd}',
                    'iliashasbi@gmail.com',
                    ['iliashasbi@gmail.com'],
                    fail_silently=False,
                )
        return Response('okok',status=200)
    
    
class ChiffreAffaires(APIView):
    permission_classes = [AllowAny]

    def get(self, request, format=None):
        chiffre_affaire_total = Transaction.objects.aggregate(chiffre_affaire_total=Sum('total'))['chiffre_affaire_total'] or 0
        print("chifre affaire")
        return Response({'chiffre_affaires': chiffre_affaire_total})
    
class ListTotal(APIView):
    
    def get(self,request,*args, **kwargs):
        affiche=Transaction.objects.values_list('total',flat=True)
        
        # faire une liste
        total_list=list(affiche)
        
        return Response({'top_vente': total_list}, status=200)    
    
    
class TopVente(APIView):
    permission_classes = [AllowAny]
    def get(self,request,*args, **kwargs):
        topVente=LigneTransaction.objects.values('produit_id').annotate(count_id=Count('produit_id')).order_by('-count_id').first()
        nom_produit=Produit.objects.get(id=topVente['produit_id']).nomProd
        return Response({'top_vente': topVente,'nomProd':nom_produit}, status=200)     
    
    
class sendMail(APIView):
    permission_classes=[AllowAny]
    def get(self,request):
        produits = Produit.objects.filter(qte__lte=F('qteMin'))
        for produit in produits:      

            send_mail(
                    'Alerte produit min atteint a recommander',
                    f'vous avez atteint le min penser a commander ce produit: {produit.nomProd}',
                    'iliashasbi@gmail.com',
                    ['iliashasbi@gmail.com'],
                    fail_silently=False,
                )
        return Response('okok',status=200)
    
class login(APIView):   
    
    def post(self,request):
        print("koko")
        username = request.POST['username']
        print("nono")
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        print("user contient",user)
        #sa verifi si il y a un valeur dans user on conitnu lalgo
        if user :
            print("on entre dans la parti token")
            token,created=Token.objects.get_or_create(user=user)
            print("token : ",token)
            return Response({'token': token.key}, status=status.HTTP_200_OK)
        else:
            # Si l'authentification échoue, vous devez renvoyer une réponse d'erreur.
            return Response({'error': 'Invalid credentials'}, status=status.HTTP_400_BAD_REQUEST) 
        
class Logout(APIView):
    def post(self,request):
        logout(request)
        return Response({"tu es bien deconnecter"}, status=status.HTTP_200_OK)
    
class Test(APIView):
    def get(self, request, code_barre, format=None):
        produit = get_object_or_404(Produit, codeBarre=code_barre)
        print(produit)
        return Response( {"nomProd": produit.nomProd}, status=status.HTTP_200_OK)        
