from django.db import models
from .fournisseur import Fournisseur
  #python manage.py makemigrations
        #python manage.py migrate

# Create your models here.
from django.db import models  
class Produit(models.Model):  
    nomProd = models.CharField(max_length=100)  
    prixAchat = models.DecimalField(max_digits=6, decimal_places=2)   
    prixVente = models.DecimalField(max_digits=6, decimal_places=2) 
    qte = models.DecimalField(max_digits=6, decimal_places=2) 
    codeBarre = models.CharField(max_length=100)
    fournisseur = models.ForeignKey(Fournisseur, on_delete=models.CASCADE, default=1)
    
    
    class Meta:  
        db_table = "produits" 

     