# views.py

from .models.personne import Users
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.core import serializers
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Users,Produit,Fournisseur,LigneTransaction,Transaction
from .serializers import FournisseurSerializer, UsersSerializer,ProduitSerializer,TransactionSerializer,LigneTransactionSerializer
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView



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
    
    
    
    
    
    
