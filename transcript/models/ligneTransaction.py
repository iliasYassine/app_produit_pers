# Remarque: vous n'avez plus besoin de "from transcript import models"
from django.db import models
from .transaction import Transaction
from .produit import Produit

class LigneTransaction(models.Model):
    transaction = models.ForeignKey(Transaction, related_name='lignes', on_delete=models.CASCADE, blank=True, null=True)
    produit = models.ForeignKey(Produit, on_delete=models.CASCADE, blank=True, null=True)
    quantite = models.PositiveIntegerField(blank=True, null=True)
    prix_unitaire = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    total = models.DecimalField(max_digits=10, decimal_places=2, editable=False, blank=True, null=True)

    def save(self, *args, **kwargs):
        self.total = self.quantite * self.prix_unitaire
        super(LigneTransaction, self).save(*args, **kwargs)

    class Meta:
        db_table = 'ligne_transactions'