from django.db import models


class ParametresSociete(models.Model):
    solde_bancaire = models.DecimalField(max_digits=12, decimal_places=2, default=0)

    class Meta:
        db_table = "parametres_societe"

    @classmethod
    def get_instance(cls):
        obj, _ = cls.objects.get_or_create(id=1)
        return obj


class Associe(models.Model):
    nom = models.CharField(max_length=100)
    solde = models.DecimalField(max_digits=10, decimal_places=2, default=0)

    class Meta:
        db_table = "associes"

    def __str__(self):
        return self.nom


class MouvementCapital(models.Model):
    TYPES = [
        ('injection', 'Injection'),
        ('retrait', 'Retrait'),
    ]
    associe = models.ForeignKey(Associe, on_delete=models.CASCADE, related_name='mouvements')
    montant = models.DecimalField(max_digits=10, decimal_places=2)
    type_mvt = models.CharField(max_length=20, choices=TYPES, default='injection')
    description = models.CharField(max_length=255, blank=True, null=True)
    document = models.FileField(upload_to='mouvements/', blank=True, null=True)
    date_mvt = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = "mouvements_capital"
        ordering = ['-date_mvt']
