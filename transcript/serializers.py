from rest_framework import serializers

from transcript.models.fournisseur import Fournisseur
from transcript.models.ligneTransaction import LigneTransaction
from transcript.models.transaction import Transaction
from .models import Users
from .models import Produit

##################USERS################
class UsersSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Users
        fields = '__all__'  # ou une liste des champs si vous voulez être
          
        
        
############PRODUIT################################       
        
class ProduitSerializer(serializers.ModelSerializer):
    
    class Meta:
        model = Produit
        fields = '__all__'  # ou une liste des champs si vous voulez être        
        
         
##########lignTransaction#################
class LigneTransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = LigneTransaction
        fields = '__all__'
        
#########TRANSACTION####################

class TransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transaction
        fields = '__all__'        
        
        
##########FOURNISSEUR###############

class FournisseurSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fournisseur
        fields = '__all__'             