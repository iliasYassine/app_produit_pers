from django.db import models

# Create your models here.
from django.db import models  
class Users(models.Model):  
    name = models.CharField(max_length=100)  
      
    class Meta:  
        db_table = "users" 