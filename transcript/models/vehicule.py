from django.db import models


class Vehicule(models.Model):
    nom = models.CharField(max_length=255)
    prix_achat = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    date_creation = models.DateField(auto_now_add=True)

    class Meta:
        db_table = 'vehicules'


class FraisVehicule(models.Model):
    vehicule = models.ForeignKey(Vehicule, related_name='frais', on_delete=models.CASCADE)
    description = models.CharField(max_length=255)
    prix = models.DecimalField(max_digits=10, decimal_places=2)
    date = models.DateField(auto_now_add=True)

    class Meta:
        db_table = 'frais_vehicules'
