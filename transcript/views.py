# views.py
from urllib import request
from django.shortcuts import render
from .models.personne import Users
#from vosk import Model, KaldiRecognizer
import wave
import json
from django.http import JsonResponse
from django.core import serializers
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Users,Produit
from .serializers import UsersSerializer,ProduitSerializer

## users

# def get(request):
#     users_list = Users.objects.all()
#     #serialiser convertir en json
#     users_json=serializers.serialize('json',users_list) 
#     user_data =json.loads(users_json)
#     return JsonResponse(user_data,safe=False)


class UsersList(APIView):
    def get(self, request, format=None):
        users = Users.objects.all()
        serializer = UsersSerializer(users, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


class ProduitList(APIView):
    def get(self, request, format=None):
        produit = Produit.objects.all()
        serializer = ProduitSerializer(produit, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)    