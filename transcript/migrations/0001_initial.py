# Generated by Django 5.0.4 on 2024-07-05 12:46

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Produit',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nomProd', models.CharField(max_length=100)),
                ('prixAchat', models.CharField(max_length=100)),
                ('prixVente', models.CharField(max_length=100)),
                ('qté', models.CharField(max_length=100)),
                ('nomFournisseur', models.CharField(max_length=100)),
                ('telFourniseur', models.CharField(max_length=100)),
                ('adrFournisseur', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'produits',
            },
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'users',
            },
        ),
    ]