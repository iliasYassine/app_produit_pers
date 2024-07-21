# Remarque: vous n'avez plus besoin de "from transcript import models"
from django.db import models
from .transaction import Transaction
from .produit import Produit

class LigneTransaction(models.Model):
    transaction = models.ForeignKey(Transaction, related_name='lignes', on_delete=models.CASCADE)
    produit = models.ForeignKey(Produit, on_delete=models.CASCADE)
    quantite = models.PositiveIntegerField()
    prix_unitaire = models.DecimalField(max_digits=10, decimal_places=2)
    total = models.DecimalField(max_digits=10, decimal_places=2, editable=False)

    def save(self, *args, **kwargs):
        self.total = self.quantite * self.prix_unitaire
        super(LigneTransaction, self).save(*args, **kwargs)

    class Meta:
        db_table = 'ligne_transactions'