from django.db import models

# Create your models here.
from django.db import models  
class Users(models.Model):  
    name = models.CharField(max_length=100)  
    prenom=models.CharField(max_length=100) 
    tel=models.CharField(max_length=100)
      
    class Meta:  
        db_table = "users" 
        
#python manage.py makemigrations
#python manage.py migrate        
#python manage.py migrate --fake-initial