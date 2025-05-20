
from django.db import models
from .client import ClientModel
import random
import string

class CommandeModel(models.Model):  
    client = models.ForeignKey(ClientModel, on_delete=models.CASCADE, blank=True, null=True)  
    date_commande = models.DateTimeField(auto_now_add=True, blank=True, null=True)  
    montant_total = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    statut = models.CharField(max_length=20, blank=True, null=True,default="En préparation")
    type_expedition = models.CharField(max_length=20,blank=True, null=True )
    numero_suivi = models.CharField(max_length=100, blank=True, null=True)
    commentaire = models.TextField(blank=True, null=True)
    numero_expediteur= models.CharField(max_length=100, blank=True, null=True)
    facture= models.FileField(upload_to='factures/', blank=True, null=True)
    
    def generate_numero_suivi(self):
        date_part = self.date_commande.strftime('%Y%m%d') if self.date_commande else '000'
        random_part = ''.join(random.choices(string.ascii_uppercase + string.digits, k=6))
        return f"CMD-{date_part}-{random_part}"

    def save(self, *args, **kwargs):
        if not self.numero_suivi:
            self.numero_suivi = self.generate_numero_suivi()
        super().save(*args, **kwargs)                                          

    class Meta:  
        db_table = "commandes"