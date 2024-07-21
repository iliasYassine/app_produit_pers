from django.db import models
from django.utils import timezone

class Transaction(models.Model):
    date_heure = models.DateTimeField(default=timezone.now)
    total = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    # Si vous avez un modèle Employé/User :
    employe = models.ForeignKey('Users', on_delete=models.SET_NULL, null=True, blank=True)
    # Ajoutez d'autres champs au besoin (par ex. moyen de paiement, etc.)

    class Meta:
        db_table = 'transactions'