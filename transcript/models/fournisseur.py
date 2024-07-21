from django.db import models
  #python manage.py makemigrations
        #python manage.py migrate

# Create your models here.
from django.db import models  
class Fournisseur(models.Model):  
    nom = models.CharField(max_length=100)  
    tel = models.CharField(max_length=100)
    adresse = models.CharField(max_length=100)   
    email  = models.CharField(max_length=100)  
     
    
    class Meta:  
        db_table = "fournisseurs" 

     