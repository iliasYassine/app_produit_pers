from rest_framework import serializers

from transcript.models.client import ClientModel
from transcript.models.commande import CommandeModel
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
# class LigneTransactionSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = LigneTransaction
#         fields = '__all__'
        
class LigneTransactionSerializer(serializers.ModelSerializer):
    produitDetails = ProduitSerializer(source='produit', read_only=True)  # Sérialiseur imbriqué pour le produit

    class Meta:
        model = LigneTransaction
        fields = ['id', 'quantite', 'prix_unitaire', 'total', 'produit', 'transaction', 'produitDetails']  # Inclure produitDetails
        
        
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
        
#############COMMANDE#####################

class CommandeSerializer(serializers.ModelSerializer):
    facture = serializers.FileField(use_url=True, required=False, allow_null=True)
    class Meta:
        model = CommandeModel
        fields = '__all__'   
    def create(self, validated_data):
        # Si 'statut' n'est pas fourni ou vide, on force la valeur par défaut
        if not validated_data.get('statut'):
            validated_data['statut'] = "En préparation"
        return super().create(validated_data)    
        
############CLIENT#####################
class ClientSerializer(serializers.ModelSerializer):
    class Meta:
        model = ClientModel
        fields = '__all__'        

        