from rest_framework import serializers
from .models import Users
from .models import Produit
class UsersSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Users
        fields = '__all__'  # ou une liste des champs si vous voulez être
          
        
        
       
        
class ProduitSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Produit
        fields = '__all__'  # ou une liste des champs si vous voulez être        
        
         
    