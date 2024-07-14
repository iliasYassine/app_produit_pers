from django.db import models
  #python manage.py makemigrations
        #python manage.py migrate

# Create your models here.
from django.db import models  
class Produit(models.Model):  
    nomProd = models.CharField(max_length=100)  
    prixAchat = models.DecimalField(max_digits=6, decimal_places=2)   
    prixVente = models.DecimalField(max_digits=6, decimal_places=2) 
    qte = models.DecimalField(max_digits=6, decimal_places=2) 
    nomFournisseur = models.CharField(max_length=100)
    telFourniseur = models.CharField(max_length=100)
    adrFournisseur = models.CharField(max_length=100)
    
    class Meta:  
        db_table = "produits" 

     