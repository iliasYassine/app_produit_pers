from django.db import models
from django.utils import timezone

class Transaction(models.Model):
    date_heure = models.DateTimeField(default=timezone.now, blank=True, null=True)
    total = models.DecimalField(max_digits=10, decimal_places=2, default=0.00, blank=True, null=True)
    employe = models.ForeignKey('Users', on_delete=models.SET_NULL, null=True, blank=True)

    class Meta:
        db_table = 'transactions'