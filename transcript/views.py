# views.py
from urllib import request
from django.shortcuts import render
from .models.personne import Users
from django.shortcuts import get_object_or_404
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
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView
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
    
 