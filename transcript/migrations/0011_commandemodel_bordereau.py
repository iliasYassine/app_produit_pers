# Generated by Django 5.0.4 on 2025-05-20 13:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('transcript', '0010_rename_numero_expéditeur_commandemodel_numero_expediteur'),
    ]

    operations = [
        migrations.AddField(
            model_name='commandemodel',
            name='bordereau',
            field=models.FileField(blank=True, null=True, upload_to='bordereaux/'),
        ),
    ]
