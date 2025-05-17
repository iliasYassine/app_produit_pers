from pyexpat import model
from django.db import models

  #python manage.py makemigrations
        #python manage.py migrate

# Create your models here.
from django.db import models  
class Users(models.Model):  
    name = models.CharField(max_length=100, blank=True, null=True)  
    prenom = models.CharField(max_length=100, blank=True, null=True)
    tel = models.CharField(max_length=100, blank=True, null=True)
    
    
    
    class Meta:  
        db_table = "users" 

     