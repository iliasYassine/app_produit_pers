from django.db import models


class FraisGeneraux(models.Model):
    nom = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    prix = models.DecimalField(max_digits=10, decimal_places=2)
    ticket = models.FileField(upload_to='frais/', blank=True, null=True)
    date = models.DateField(auto_now_add=True)

    class Meta:
        db_table = 'frais_generaux'
        ordering = ['-date']
