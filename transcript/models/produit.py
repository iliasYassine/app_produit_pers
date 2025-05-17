from django.db import models
from .fournisseur import Fournisseur
  #python manage.py makemigrations
        #python manage.py migrate

# Create your models here.
from django.db import models  
class Produit(models.Model):  
    nomProd = models.CharField(max_length=100, blank=True, null=True)  
    prixAchat = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)   
    prixVente = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True) 
    qte = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True) 
    qteMin = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True) 
    codeBarre = models.CharField(max_length=100, blank=True, null=True)
    fournisseur = models.ForeignKey(Fournisseur, on_delete=models.CASCADE, default=1, blank=True, null=True)
    
    class Meta:  
        db_table = "produits" 

     