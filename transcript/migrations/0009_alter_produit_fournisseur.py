# Generated by Django 5.0.4 on 2024-07-21 13:14

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('transcript', '0008_lignetransaction'),
    ]

    operations = [
        migrations.AlterField(
            model_name='produit',
            name='fournisseur',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='transcript.fournisseur'),
        ),
    ]