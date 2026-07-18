from django.db import migrations


def backfill_prix_achat_unitaire(apps, schema_editor):
    LigneTransaction = apps.get_model('transcript', 'LigneTransaction')
    for ligne in LigneTransaction.objects.filter(produit__isnull=False, prix_achat_unitaire__isnull=True).select_related('produit'):
        ligne.prix_achat_unitaire = ligne.produit.prixAchat
        ligne.save(update_fields=['prix_achat_unitaire'])


def noop(apps, schema_editor):
    pass


class Migration(migrations.Migration):

    dependencies = [
        ('transcript', '0021_lignetransaction_prix_achat_unitaire_and_more'),
    ]

    operations = [
        migrations.RunPython(backfill_prix_achat_unitaire, noop),
    ]
