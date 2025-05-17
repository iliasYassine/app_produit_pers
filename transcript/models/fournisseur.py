from django.db import models
  #python manage.py makemigrations
        #python manage.py migrate

# Create your models here.
from django.db import models  
class Fournisseur(models.Model):  
  nom = models.CharField(max_length=100, blank=True, null=True)  
  tel = models.CharField(max_length=100, blank=True, null=True)
  adresse = models.CharField(max_length=100, blank=True, null=True)   
  email  = models.CharField(max_length=100, blank=True, null=True)  
   
  class Meta:  
    db_table = "fournisseurs" 

     