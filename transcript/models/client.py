from django.db import models
class ClientModel(models.Model):  
    
    nom = models.CharField(max_length=100 ,blank=True, null=True)  
    prenom = models.CharField(max_length=100, blank=True, null=True)
    email = models.EmailField(unique=True,blank=True, null=True)  
    telephone = models.CharField(max_length=15, blank=True, null=True)  
    adresse = models.TextField(blank=True, null=True)  

    class Meta:  
        db_table = "clients"