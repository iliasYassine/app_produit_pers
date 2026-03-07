# views.py

from decimal import Decimal
from email.message import EmailMessage
from itertools import count
import os
from django.core.mail import EmailMessage
import stripe
from myproject import settings
from transcript.models import transaction
from .models.personne import Users
from django.shortcuts import get_object_or_404
from django.http import JsonResponse
from django.core import serializers
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Users,Produit,Fournisseur,LigneTransaction,Transaction,CommandeModel,ClientModel
from .serializers import ClientSerializer, CommandeSerializer, FournisseurSerializer, UsersSerializer,ProduitSerializer,TransactionSerializer,LigneTransactionSerializer,CommandeSerializer
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView
from django.shortcuts import get_object_or_404
from django.db import transaction as db_transaction
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.permissions import AllowAny
from django.shortcuts import get_object_or_404
from django.db import transaction as db_transaction 
from .serializers import LigneTransactionSerializer
from django.db.models import Sum
from django.db.models import Count
from django.core.mail import send_mail
from django.db.models import F
from rest_framework.test import APIClient
from django.contrib.auth import authenticate, login
from rest_framework.authtoken.models import Token    
from django.contrib.auth.models import User
from django.contrib.auth import logout
from icecream import ic
from reportlab.lib.pagesizes import A4
from reportlab.pdfgen import canvas
from io import BytesIO
from django.core.files.base import ContentFile
import requests
from zeep import Client, Transport
from django.db.models.functions import TruncMonth
import urllib3  
import pandas as pd
urllib3.disable_warnings()


class UsersList(APIView):
    def get(self, request, format=None):
        users = Users.objects.all()
        serializer = UsersSerializer(users, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    
    
#@method_decorator(csrf_exempt, name='dispatch')    
class UsersCreate(APIView):
    permission_classes = [AllowAny]
    def post(self,request,format=None):
        serializers=UsersSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data ,status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
class UserDetail(APIView):
    # GET, PUT, DELETE /users/<id>/
    def get(self, request, pk, format=None):
        user = get_object_or_404(Users, pk=pk)
        serializer = UsersSerializer(user)
        return Response(serializer.data)
    
    def put(self, request, pk, format=None):
        user = get_object_or_404(Users, pk=pk)
        serializer = UsersSerializer(user, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk, format=None):
        user = get_object_or_404(Users, pk=pk)
        user.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)    


class ProduitList(APIView):
    def get(self, request, format=None):
        produit = Produit.objects.all()
        serializer = ProduitSerializer(produit, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)    
    
class ProduitCreate(APIView):
    permission_classes = [AllowAny]
    def post(self, request, format=None):
        try:
            # Résoudre le fournisseur explicitement pour éviter le default=1 en cache
            fournisseur_id = request.data.get('fournisseur') or None
            fournisseur = Fournisseur.objects.filter(id=fournisseur_id).first() if fournisseur_id else None

            serializer = ProduitSerializer(data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save(fournisseur=fournisseur)
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except Exception as e:
            import traceback
            return Response({'error': str(e), 'trace': traceback.format_exc()}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
  
class ProduitDetails(APIView):
    # GET, PUT, DELETE /users/<id>/
    def get(self, request, pk, format=None):
        produit = get_object_or_404(Produit, pk=pk)
        serializer = ProduitSerializer(produit)
        return Response(serializer.data)
    
    def put(self, request, pk, format=None):
        produit = get_object_or_404(Produit, pk=pk)
        serializer = ProduitSerializer(produit, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def patch(self, request, pk, format=None):
        produit = get_object_or_404(Produit, pk=pk)
        serializer = ProduitSerializer(produit, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        produit = get_object_or_404(Produit, pk=pk)
        produit.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)



    
###########Fournisseur##############    
class FournisseurList(APIView):
    def get(self, request, format=None):
        fournisseur = Fournisseur.objects.all()
        serializer = FournisseurSerializer(fournisseur, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)    
    
class FournisseurCreate(APIView):
    permission_classes = [AllowAny]
    def post(self,request,format=None):
        serializers=FournisseurSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data ,status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)
    
  
class FournisseurDetails(APIView):
    # GET, PUT, DELETE /users/<id>/
    def get(self, request, pk, format=None):
        fournisseur = get_object_or_404(Fournisseur, pk=pk)
        serializer = FournisseurSerializer(fournisseur)
        return Response(serializer.data)
    
    def put(self, request, pk, format=None):
        fourniseur = get_object_or_404(Fournisseur, pk=pk)
        serializer = FournisseurSerializer(fourniseur, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk, format=None):
        fournisseur = get_object_or_404(Produit, pk=pk)
        fournisseur.delete()
        return Response(status=status.HTTP_204_NO_CONTENT) 
    
    
class LigneTransactionDetails(APIView):
    # GET, PUT, DELETE /users/<id>/
    
    def get(self, request, pk=None, format=None):
        if pk:  # Si un ID est fourni, récupérer une ligne spécifique
            lignTransac = get_object_or_404(LigneTransaction, pk=pk)
            serializer = LigneTransactionSerializer(lignTransac)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:  # Sinon, récupérer toutes les lignes
            lignes = LigneTransaction.objects.all()
            serializer = LigneTransactionSerializer(lignes, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
    
    def put(self, request, pk, format=None):
        lignTransac = get_object_or_404(LigneTransaction, pk=pk)
        serializer = TransactionSerializer(lignTransac, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk, format=None):
        lignTransac = get_object_or_404(LigneTransaction, pk=pk)
        lignTransac.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)  
    
class TransactionView(APIView):
    # GET, PUT, DELETE /users/<id>/
    
    def get(self, request, pk=None, format=None):
        if pk:  # Si un ID est fourni, récupérer une ligne spécifique
            transac = get_object_or_404(Transaction, pk=pk)
            serializer = TransactionSerializer(transac)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:  # Sinon, récupérer toutes les lignes
            transac = Transaction.objects.all()
            serializer = TransactionSerializer(transac, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
    
    def put(self, request, pk, format=None):
        transac = get_object_or_404(Transaction, pk=pk)
        serializer = TransactionSerializer(transac, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    def delete(self, request, pk, format=None):
        transac = get_object_or_404(Transaction, pk=pk)
        # Annule l'effet sur le solde bancaire si la transaction était finalisée
        if transac.total:
            from .models.capital import ParametresSociete as PS
            params, _ = PS.objects.get_or_create(pk=1)
            params.solde_bancaire = (params.solde_bancaire or 0) - transac.total
            params.save()
        transac.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class  scanProduit(APIView):
    permission_classes = [AllowAny]
    
    def post(self,request,format=None):
        code_barre =request.data.get('codeBarre')
        if not code_barre:
            return Response({'erreur': 'Un code-barre est requis.'}, status=status.HTTP_400_BAD_REQUEST) 
             
                
        with db_transaction.atomic():
            produit=get_object_or_404(Produit,codeBarre=code_barre)
            if produit.qte is None or produit.qte <= 0:
                return Response({'erreur': 'Stock insuffisant pour le produit demandé.'}, status=status.HTTP_400_BAD_REQUEST)
            #on gere la transaction mtn qu'on a le produit
            transaction_id = request.data.get('transaction_id')
            if not transaction_id:
                transaction = Transaction()
                transaction.save()
            else:
                transaction = get_object_or_404(Transaction, id=transaction_id)

            # Gestion de la ligne de transaction
            ligne_transaction, created = LigneTransaction.objects.get_or_create(
                transaction=transaction,
                produit=produit,
                defaults={'quantite': 1, 'prix_unitaire': produit.prixVente}
            )
            if not created:
                ligne_transaction.quantite += 1
                ligne_transaction.total = ligne_transaction.quantite * ligne_transaction.prix_unitaire
                ligne_transaction.save()


            # mise a jour total dans transaction
            # Mise à jour du total de la transaction
            transaction_total = transaction.lignes.all().aggregate(
            total_sum=Sum('total')
            )['total_sum'] or 0
            transaction.total = transaction_total
            transaction.save()



            # Sérialisation de la ligne de transaction pour la réponse
            ligne_serializer = LigneTransactionSerializer(ligne_transaction)
            return Response(ligne_serializer.data, status=status.HTTP_201_CREATED)

class LigneLibreCreate(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        description = request.data.get('description_libre', '').strip()
        prix = request.data.get('prix_unitaire')
        transaction_id = request.data.get('transaction_id')

        if not prix:
            return Response({'error': 'prix_unitaire requis'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            from decimal import Decimal
            prix = Decimal(str(prix))
        except Exception:
            return Response({'error': 'prix_unitaire invalide'}, status=status.HTTP_400_BAD_REQUEST)

        if transaction_id:
            transaction = get_object_or_404(Transaction, id=transaction_id)
        else:
            transaction = Transaction.objects.create()

        ligne = LigneTransaction.objects.create(
            transaction=transaction,
            produit=None,
            description_libre=description,
            quantite=1,
            prix_unitaire=prix,
        )
        serializer = LigneTransactionSerializer(ligne)
        return Response({**serializer.data, 'transaction': transaction.id}, status=status.HTTP_201_CREATED)


class FinalizeTransaction(APIView):
    permission_classes = [AllowAny]

    def post(self, request, *args, **kwargs):
        transaction_id = request.data.get('transaction_id') or request.session.get('transaction_id', None)
        request.session.pop('transaction_id', None)
        if not transaction_id:
            return Response({'erreur': 'Aucune transaction en cours.'}, status=status.HTTP_400_BAD_REQUEST)

        with db_transaction.atomic():
            transaction = get_object_or_404(Transaction, id=transaction_id)
            transaction_total = LigneTransaction.objects.filter(transaction=transaction).aggregate(Sum('total'))['total__sum'] or 0
            transaction.total = transaction_total
            transaction.save()

            # Décrémentation du stock au moment de la finalisation
            for ligne in transaction.lignes.select_for_update().all():
                if ligne.produit and ligne.quantite:
                    ligne.produit.qte = (ligne.produit.qte or 0) - ligne.quantite
                    ligne.produit.save()

            # Mise à jour automatique du solde bancaire
            from .models.capital import ParametresSociete as PS
            params, _ = PS.objects.get_or_create(pk=1)
            params.solde_bancaire = (params.solde_bancaire or 0) + transaction_total
            params.save()

            transaction_serializer = TransactionSerializer(transaction)
            return Response(transaction_serializer.data, status=status.HTTP_200_OK)
        
        
         

class ChiffreAffaires(APIView):
    permission_classes = [AllowAny]

    def get(self, request, format=None):
        chiffre_affaire_total = Transaction.objects.aggregate(chiffre_affaire_total=Sum('total'))['chiffre_affaire_total'] or 0
        print("chifre affaire")
        return Response({'chiffre_affaires': chiffre_affaire_total})
    
class ListTotal(APIView):
    
    def get(self,request,*args, **kwargs):
        affiche=Transaction.objects.values_list('total',flat=True)
        
        # faire une liste
        total_list=list(affiche)
        
        return Response({'top_vente': total_list}, status=200)    
    
class Benefice(APIView):
    permission_classes = [AllowAny]

    def get(self, request, format=None):
        # Chiffre d'affaires
        chiffre_affaire_total = Transaction.objects.aggregate(
            chiffre_affaire_total=Sum('total')
        )['chiffre_affaire_total'] or 0

        # Coût des produits vendus
        cout_total = LigneTransaction.objects.aggregate(
            cout_total=Sum(F('quantite') * F('produit__prixAchat'))
        )['cout_total'] or 0

        benefice = chiffre_affaire_total - cout_total

        return Response({'benefice': benefice})
        
class BeneficeParMois(APIView):
    permission_classes = [AllowAny]

    def get(self, request, format=None):
        # Chiffre d'affaires par mois
        ca_par_mois = (
            Transaction.objects
            .annotate(mois=TruncMonth('date_heure'))
            .values('mois')
            .annotate(chiffre_affaires=Sum('total'))
            .order_by('mois')
        )
        print(ca_par_mois)

        # Coût des produits vendus par mois
        cout_par_mois = (
            LigneTransaction.objects
            .annotate(mois=TruncMonth('transaction__date_heure'))
            .values('mois')
            .annotate(cout_total=Sum(F('quantite') * F('produit__prixAchat')))
            .order_by('mois')
        )
        print(cout_par_mois)

        # Fusionner les deux résultats
        result = []
        cout_dict = {c['mois']: c['cout_total'] for c in cout_par_mois}
        for ca in ca_par_mois:
            mois = ca['mois']
            chiffre_affaires = ca['chiffre_affaires'] or 0
            cout_total = cout_dict.get(mois, 0) or 0
            benefice = chiffre_affaires - cout_total
            result.append({
                'mois': mois,
                'chiffre_affaires': chiffre_affaires,
                'cout_total': cout_total,
                'benefice': benefice
            })
            print("result",result)
        return Response(result)
    
from django.db.models.functions import TruncWeek

class BeneficeParSemaine(APIView):
    permission_classes = [AllowAny]

    def get(self, request, format=None):
        ca_par_semaine = (
            Transaction.objects
            .annotate(semaine=TruncWeek('date_heure'))
            .values('semaine')
            .annotate(chiffre_affaires=Sum('total'))
            .order_by('semaine')
        )

        cout_par_semaine = (
            LigneTransaction.objects
            .annotate(semaine=TruncWeek('transaction__date_heure'))
            .values('semaine')
            .annotate(cout_total=Sum(F('quantite') * F('produit__prixAchat')))
            .order_by('semaine')
        )

        result = []
        cout_dict = {c['semaine']: c['cout_total'] for c in cout_par_semaine}
        for ca in ca_par_semaine:
            semaine = ca['semaine']
            chiffre_affaires = ca['chiffre_affaires'] or 0
            cout_total = cout_dict.get(semaine, 0) or 0
            benefice = chiffre_affaires - cout_total
            result.append({
                'semaine': semaine,
                'chiffre_affaires': chiffre_affaires,
                'cout_total': cout_total,
                'benefice': benefice
            })
        return Response(result)
    
                    
class TopVente(APIView):
    permission_classes = [AllowAny]
    def get(self, request, *args, **kwargs):
        topVente = LigneTransaction.objects.values('produit_id').annotate(count_id=Count('produit_id')).order_by('-count_id').first()
        if not topVente:
            return Response({'top_vente': None, 'nomProd': None}, status=200)
        nom_produit = Produit.objects.filter(id=topVente['produit_id']).values_list('nomProd', flat=True).first()
        return Response({'top_vente': topVente, 'nomProd': nom_produit}, status=200)


class sendMail(APIView):
    permission_classes = [AllowAny]

    def get(self, request):
        produits = Produit.objects.filter(qte__lte=F('qteMin'))
        
        if not produits.exists():
            return Response('Aucun produit en rupture', status=200)
        
        # Créer la liste des produits en rupture
        liste_produits = []
        for produit in produits:
            liste_produits.append(f"- {produit.nomProd} ")
        
        # Créer le message avec tous les produits
        message = f"""Alerte : {len(produits)} produit(s) ont atteint le stock minimum.

Produits à recommander :
{chr(10).join(liste_produits)}

Merci de passer commande rapidement.
"""
        
        # Envoyer un seul email avec tous les produits
        email = EmailMessage(
        subject=f'Alerte stock : {len(produits)} produit(s) à recommander',
        body=message,
        from_email='iliashasbi@gmail.com',
        to=['iliashasbi@gmail.com','m.braikia@orange.fr'],
    )
        print(liste_produits)
        
        
        data=[]
        for produit in produits:
            prix_achat=produit.prixAchat or 0
            total=prix_achat * 5
            data.append(
                {
                    'Nom Produit': produit.nomProd,
                    'Quantité': 5,    
                    'Prix Achat': prix_achat,
                    'total': total
                }
            )
        df = pd.DataFrame(data)
        somme_total=df['total'].sum()
        # Ajouter une ligne de total à la fin
        ligne_total = {
            'Nom Produit': 'TOTAL',
            'Quantité': '',
            'Prix Achat': '',
            'total': somme_total
        }
        # Utiliser concat au lieu de append
        df = pd.concat([df, pd.DataFrame([ligne_total])], ignore_index=True)
        
        chemin_fichier = os.path.join(os.getcwd(), 'media', 'produits_en_rupture.xlsx')
        df.to_excel(chemin_fichier, index=False)
        
        email.attach_file(chemin_fichier)
        try:
            email.send(fail_silently=False)
        except Exception as e:
            return Response({'erreur': str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

        return Response(f'Email envoyé pour {len(produits)} produit(s) en rupture', status=200)
    
class login(APIView):   
    
    def post(self,request):
        print("koko")
        username = request.POST['username']
        print("nono")
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        print("user contient",user)
        #sa verifi si il y a un valeur dans user on conitnu lalgo
        if user :
            print("on entre dans la parti token")
            token,created=Token.objects.get_or_create(user=user)
            print("token : ",token)
            return Response({'token': token.key}, status=status.HTTP_200_OK)
        else:
            # Si l'authentification échoue, vous devez renvoyer une réponse d'erreur.
            return Response({'error': 'Invalid credentials'}, status=status.HTTP_400_BAD_REQUEST) 
        
class Logout(APIView):
    def post(self,request):
        logout(request)
        return Response({"tu es bien deconnecter"}, status=status.HTTP_200_OK)
    
class Test(APIView):
    permission_classes = [AllowAny]
    def get(self, request, code_barre, format=None):
        produit = get_object_or_404(Produit, codeBarre=code_barre)
        serializer = ProduitSerializer(produit)
        return Response(serializer.data, status=status.HTTP_200_OK)


class ResetTransactions(APIView):

    def post(self, request, format=None):
        # Supprime toutes les transactions
        Transaction.objects.all().delete()  
        
        return Response({'message': 'Toutes les transactions ont été réinitialisées.'}, status=status.HTTP_204_NO_CONTENT)
    
    
class ClientApi(APIView):
    def get(self, request, pk=None, format=None):
        if pk:  # Si un ID est fourni, récupérer un client spécifique
            client = get_object_or_404(ClientModel, pk=pk)
            serializer = ClientSerializer(client)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:  # Sinon, récupérer tous les clients
            clients = ClientModel.objects.all()
            serializer = ClientSerializer(clients, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request, format=None):
        serializer = ClientSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, pk, format=None):
        client = get_object_or_404(ClientModel, pk=pk)
        serializer = ClientSerializer(client, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        client = get_object_or_404(ClientModel, pk=pk)
        client.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)  
        
    
class Commande(APIView):
    def get(self, request, pk=None, format=None):
        if pk:  # Si un ID est fourni, récupérer une commande spécifique
            cmd = get_object_or_404(CommandeModel, pk=pk)
            serializer = CommandeSerializer(cmd)
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:  # Sinon, récupérer toutes les commandes
            cmd = CommandeModel.objects.all()
            serializer = CommandeSerializer(cmd, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)

    
    def post(self, request, format=None):
        serializer = CommandeSerializer(data=request.data)
        if serializer.is_valid():
            commande = serializer.save()
            # Générer le PDF
            pdf_buffer = generate_facture_pdf(commande)
            # Sauvegarder le PDF dans un champ FileField (ex: commande.facture)
            commande.facture.save(f"facture_{commande.id}.pdf", ContentFile(pdf_buffer.read()))
            etiquette_url = create_mondialrelay_shipment(commande)
            if etiquette_url:
                # Télécharge le PDF et sauvegarde-le dans le champ bordereau
                import requests
                response = requests.get(etiquette_url)
                if response.status_code == 200:
                    commande.bordereau.save(f"bordereau_{commande.id}.pdf", ContentFile(response.content))
            commande.save()
            return Response(CommandeSerializer(commande).data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, pk, format=None):
        cmd = get_object_or_404(CommandeModel, pk=pk)
        serializer = CommandeSerializer(cmd, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        cmd = get_object_or_404(CommandeModel, pk=pk)
        cmd.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)      
    
def generate_facture_pdf(commande):
    buffer = BytesIO()
    p = canvas.Canvas(buffer, pagesize=A4)
    p.setFont("Helvetica", 16)
    p.drawString(100, 800, "Facture Commande")
    p.setFont("Helvetica", 12)
    p.drawString(100, 770, f"Numéro de commande : {commande.id}")
    p.drawString(100, 750, f"Date : {commande.date_commande.strftime('%d/%m/%Y')}")
    p.drawString(100, 730, f"Montant total : {commande.montant_total} €")
    p.showPage()
    p.save()
    buffer.seek(0)
    return buffer
import hashlib

def generate_security_key(params, private_key):
    # Ordre exact des champs selon la doc Mondial Relay
    fields = [
        'Enseigne', 'ModeCol', 'ModeLiv', 'NDossier', 'NClient', 'Expe_Langage',
        'Expe_Ad1', 'Expe_Ad2', 'Expe_Ad3', 'Expe_Ad4', 'Expe_Ville', 'Expe_CP', 'Expe_Pays',
        'Expe_Tel1', 'Expe_Tel2', 'Expe_Mail', 'Dest_Langage', 'Dest_Ad1', 'Dest_Ad2', 'Dest_Ad3',
        'Dest_Ad4', 'Dest_Ville', 'Dest_CP', 'Dest_Pays', 'Dest_Tel1', 'Dest_Tel2', 'Dest_Mail',
        'Poids', 'Longueur', 'Taille', 'NbColis', 'CRT_Valeur', 'CRT_Devise', 'Exp_Valeur',
        'Exp_Devise', 'COL_Rel_Pays', 'COL_Rel', 'LIV_Rel_Pays', 'LIV_Rel', 'TAvisage',
        'TReprise', 'Montage', 'TRDV', 'Assurance', 'Instructions'
    ]
    chaine = ''.join(str(params.get(f, '')) for f in fields) + private_key
    return hashlib.md5(chaine.encode('utf-8')).hexdigest().upper()


def create_mondialrelay_shipment(commande):
    enseigne = settings.MONDIAL_RELAY_ENSEIGNE
    key = settings.MONDIAL_RELAY_KEY

    client = commande.client

    # Civilité (à adapter dynamiquement si tu as l'info)
    civilite = "MR"
    nom = client.nom.upper()
    prenom = client.prenom.upper()
    adresse = client.adresse.upper()
    ville = client.ville.upper()
    code_postal = str(client.code_postal).zfill(5)  # 5 chiffres
    # Téléphone au format Mondial Relay
    telephone = client.telephone.replace(" ", "")
    if telephone.startswith("+33"):
        tel_ok = "0" + telephone[3:]
    elif telephone.startswith("0033"):
        tel_ok = "0" + telephone[4:]
    else:
        tel_ok = telephone
    tel_ok = tel_ok[:10]  # 10 chiffres

    # Email conforme RFC2822 et longueur
    email = client.email.lower()
    if len(email) < 7 or len(email) > 70:
        email = "test@test.com"

    params = {
        'Enseigne': enseigne,  # 8 caractères fixes
        'ModeCol': 'CCC',      # Collecte à domicile
        'ModeLiv': '24R',      # Livraison Point Relais
        'NDossier': '',        # Facultatif
        'NClient': str(client.id)[:9],  # 9 caractères max
        'Expe_Langage': 'FR',
        'Expe_Ad1': f'{civilite} HASBI ILIAS',  # Civilité + nom/prénom en MAJ
        'Expe_Ad2': '',
        'Expe_Ad3': '3 RUE DU PONT',
        'Expe_Ad4': '',
        'Expe_Ville': 'CLUSES',
        'Expe_CP': '74300',
        'Expe_Pays': 'FR',
        'Expe_Tel1': '0650378032',
        'Expe_Tel2': '',
        'Expe_Mail': 'ihpconcept74@gmail.com',
        'Dest_Langage': 'FR',
        'Dest_Ad1': 'MR FRANCIS ALBERT',  # Civilité + nom en MAJ
        'Dest_Ad2': '',               # Prénom en MAJ
        'Dest_Ad3':'5 BIS RUE FAIDHERBE',              # Adresse en MAJ
        'Dest_Ad4': '',
        'Dest_Ville': 'SAVIGNY SUR ORGE',
        'Dest_CP': '91600',
        'Dest_Pays': 'FR',
        'Dest_Tel1': '+33650378032',
        'Dest_Tel2': '',
        'Dest_Mail': 'meryem.soda',
        'Poids': '1000',         # 1000g = 1kg
        'Longueur': '20',        # Facultatif
        'Taille': '',            # Facultatif, laisser vide sauf consigne contraire
        'NbColis': '1',          # 1 ou 2 chiffres
        'CRT_Valeur': '0',       # 0 si pas de contre-remboursement
        'CRT_Devise': '',        # Facultatif
        'Exp_Valeur': '',        # Facultatif
        'Exp_Devise': '',        # Facultatif
        'COL_Rel_Pays': '',      # Facultatif
        'COL_Rel': '',           # Facultatif
        'LIV_Rel_Pays': 'FR',    # Obligatoire pour 24R
        'LIV_Rel': '',           # Facultatif (ou code Point Relais)
        'TAvisage': '',          # Facultatif
        'TReprise': '',          # Facultatif
        'Montage': '',           # Facultatif
        'TRDV': '',              # Facultatif
        'Assurance': '',         # Facultatif
        'Instructions': '',      # Facultatif
        # Pas de 'Security' ici !
    }

    # Génération de la clé de sécurité
    params['Security'] = generate_security_key(params, key)

    print("Params envoyés à Mondial Relay :", params)

    session = requests.Session()
    session.verify = False
    transport = Transport(session=session)
    try:
        client_zeep = Client(wsdl=settings.MONDIAL_RELAY_API_URL.strip() + "?WSDL", transport=transport)
        result = client_zeep.service.WSI2_CreationExpedition(**params)
        numero = result['ExpeditionNum']
        etiquette = client_zeep.service.WSI3_GetEtiquettes(
            Enseigne=enseigne,
            Expeditions=numero,
            Langue='FR',
            Security=params['Security']
        )
        url_pdf = (
            getattr(etiquette, 'URL_PDF_A4', None)
            or getattr(etiquette, 'URL_PDF_A5', None)
            or getattr(etiquette, 'URL_PDF_10x15', None)
        )
        if url_pdf:
            return url_pdf
        print("Aucune étiquette PDF générée, STAT =", getattr(etiquette, 'STAT', None))
        return None
    except Exception as e:
        print("Erreur Mondial Relay:", e)
        return None

# def create_mondialrelay_shipment(commande):
#     enseigne = settings.MONDIAL_RELAY_ENSEIGNE
#     key = settings.MONDIAL_RELAY_KEY

#     client = commande.client  # Récupère le client lié à la commande

#     # Mise en forme des champs selon la doc Mondial Relay
#     civilite = "MR"  # ou adapte selon le genre du client si tu as l'info
#     nom = client.nom.upper()
#     prenom = client.prenom.upper()
#     adresse = client.adresse.upper()
#     ville = client.ville.upper()
#     code_postal = client.code_postal
#     telephone = client.telephone.replace("+33", "0") if client.telephone.startswith("+33") else client.telephone
#     telephone = telephone.replace(" ", "")
#     if telephone.startswith("0") and len(telephone) == 10:
#         tel_ok = telephone
#     elif telephone.startswith("+33") and len(telephone) == 12:
#         tel_ok = "0" + telephone[3:]
#     else:
#         tel_ok = telephone  # fallback

#     params = {
#         'Enseigne': enseigne,
#         'ModeCol': 'CCC',
#         'ModeLiv': '24R',
#         'NDossier': '',
#         'NClient': str(client.id),
#         'Expe_Langage': 'FR',
#         'Expe_Ad1': f'{civilite} HASBI ILIAS',
#         'Expe_Ad2': '',
#         'Expe_Ad3': '3 RUE DU PONT',
#         'Expe_Ad4': '',
#         'Expe_Ville': 'CLUSSES',
#         'Expe_CP': '74300',
#         'Expe_Pays': 'FR',
#         'Expe_Tel1': '0650378032',
#         'Expe_Tel2': '',
#         'Expe_Mail': 'ihpconcept74@gmail.com',
#         'Dest_Langage': 'FR',
#         'Dest_Ad1': f'{civilite} {nom}',
#         'Dest_Ad2': prenom,
#         'Dest_Ad3': adresse,
#         'Dest_Ad4': '',
#         'Dest_Ville': ville,
#         'Dest_CP': code_postal,
#         'Dest_Pays': 'FR',
#         'Dest_Tel1': tel_ok,
#         'Dest_Tel2': '',
#         'Dest_Mail': client.email,
#         'Poids': '1000',
#         'Longueur': '20',
#         'Taille': '',
#         'NbColis': '1',
#         'CRT_Valeur': '0',
#         'CRT_Devise': '',
#         'Exp_Valeur': '',
#         'Exp_Devise': '',
#         'COL_Rel_Pays': '',
#         'COL_Rel': '',
#         'LIV_Rel_Pays': 'FR',
#         'LIV_Rel': '',
#         'TAvisage': '',
#         'TReprise': '',
#         'Montage': '',
#         'TRDV': '',
#         'Assurance': '',
#         'Instructions': '',
#         'Security': key,
#     }
#     print("Params envoyés à Mondial Relay :", params)

#     session = requests.Session()
#     session.verify = False
#     transport = Transport(session=session)
#     try:
#         client_zeep = Client(wsdl=settings.MONDIAL_RELAY_API_URL.strip() + "?WSDL", transport=transport)
#         result = client_zeep.service.WSI2_CreationExpedition(**params)
#         numero = result['ExpeditionNum']
#         etiquette = client_zeep.service.WSI3_GetEtiquettes(
#             Enseigne=enseigne,
#             Expeditions=numero,
#             Langue='FR',
#             Security=key
#         )
#         url_pdf = getattr(etiquette, 'URL_PDF_A4', None) or getattr(etiquette, 'URL_PDF_A5', None) or getattr(etiquette, 'URL_PDF_10x15', None)
#         if url_pdf:
#             return url_pdf
#         print("Aucune étiquette PDF générée, STAT =", getattr(etiquette, 'STAT', None))
#         return None
#     except Exception as e:
#         print("Erreur Mondial Relay:", e)
#         return None    

stripe.api_key = settings.STRIPE_SECRET_KEY
class CreateStripeCheckoutSession(APIView):
    def post(self, request):
        montant = request.data.get('montant')  # en euros
        if not montant:
            return Response({'error': 'Montant manquant'}, status=400)
        try:
            session = stripe.checkout.Session.create(
                payment_method_types=['card'],
                line_items=[{
                    'price_data': {
                        'currency': 'eur',
                        'product_data': {
                            'name': 'Commande personnalisée',
                        },
                        'unit_amount': int(float(montant) * 100),  # montant en centimes
                    },
                    'quantity': 1,
                }],
                mode='payment',
                success_url='http://localhost:4200/success',  # Pour Angular en local
                cancel_url='http://localhost:4200/cancel',
            )
            return Response({'url': session.url})
        except Exception as e:
            return Response({'error': str(e)}, status=500)
         
class CommandeByNumeroSuivi(APIView):
    def get(self, request, numero_suivi, format=None):
        commande = get_object_or_404(CommandeModel, numero_suivi=numero_suivi)
        serializer = CommandeSerializer(commande)
        return Response(serializer.data, status=status.HTTP_200_OK)

class ScanByNomProd(APIView):
    permission_classes = [AllowAny]
    
    def post(self,request,format=None):
        produit =request.data.get('nomProd')
        if not produit:
            return Response({'erreur': 'Un nom de produit est requis.'}, status=status.HTTP_400_BAD_REQUEST) 
             
                
        with db_transaction.atomic():
            produit=get_object_or_404(Produit,nomProd=produit)
            if produit.qte is None or produit.qte <= 0:
                return Response({'erreur': 'Stock insuffisant pour le produit demandé.'}, status=status.HTTP_400_BAD_REQUEST)
            #on gere la transaction mtn qu'on a le produit
            transaction_id = request.data.get('transaction_id')
            if not transaction_id:
                transaction = Transaction()
                transaction.save()
            else:
                transaction = get_object_or_404(Transaction, id=transaction_id)

            # Gestion de la ligne de transaction
            ligne_transaction, created = LigneTransaction.objects.get_or_create(
                transaction=transaction,
                produit=produit,
                defaults={'quantite': 1, 'prix_unitaire': produit.prixVente}
            )
            if not created:
                ligne_transaction.quantite += 1
                ligne_transaction.total = ligne_transaction.quantite * ligne_transaction.prix_unitaire
                ligne_transaction.save()


            # mise a jour total dans transaction
            # Mise à jour du total de la transaction
            transaction_total = transaction.lignes.all().aggregate(
            total_sum=Sum('total')
            )['total_sum'] or 0
            transaction.total = transaction_total
            transaction.save()



            # Sérialisation de la ligne de transaction pour la réponse
            ligne_serializer = LigneTransactionSerializer(ligne_transaction)
            return Response(ligne_serializer.data, status=status.HTTP_201_CREATED)

# Dans tes views.py
class ExportDatabase(APIView):
    permission_classes = [AllowAny]
    
    def get(self, request):
        import subprocess
        import datetime
        import os
        backup_dir = os.path.join(settings.MEDIA_ROOT, 'bdd')
        
        # Créer le dossier s'il n'existe pas
        os.makedirs(backup_dir, exist_ok=True)
        
        # Nom du fichier avec la date
        date_str = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        fichier_export = os.path.join(backup_dir, f"export_test_{date_str}.sql")
        
        try:
            # Commande mysqldump
            cmd = [
                r"C:\xampp\mysql\bin\mysqldump.exe",
                "--host=localhost",
                "--user=root",
                "--password=",
                "--single-transaction",
                "--routines",
                "--triggers",
                "test"
            ]
            
            with open(fichier_export, 'w', encoding='utf-8') as f:
                result = subprocess.run(cmd, stdout=f, stderr=subprocess.PIPE, text=True)
            
            if result.returncode == 0:
                # Retourner le fichier en téléchargement
                from django.http import FileResponse
                response = FileResponse(
                    open(fichier_export, 'rb'),
                    as_attachment=True,
                    filename=os.path.basename(fichier_export)
                )
                return response
            else:
                return Response({'error': result.stderr}, status=500)
                
        except Exception as e:
            return Response({'error': str(e)}, status=500)


############## CAPITAL / DETTES ASSOCIÉS ##############
from .models.capital import Associe, MouvementCapital, ParametresSociete
from .serializers import AssocieSerializer, MouvementCapitalSerializer, ParametresSocieteSerializer

class AssocieView(APIView):
    permission_classes = [AllowAny]

    def get(self, request, pk=None):
        if pk:
            associe = get_object_or_404(Associe, pk=pk)
            return Response(AssocieSerializer(associe).data)
        associes = Associe.objects.all()
        return Response(AssocieSerializer(associes, many=True).data)

    def post(self, request):
        serializer = AssocieSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request, pk):
        associe = get_object_or_404(Associe, pk=pk)
        serializer = AssocieSerializer(associe, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        associe = get_object_or_404(Associe, pk=pk)
        associe.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class MouvementCapitalView(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = MouvementCapitalSerializer(data=request.data)
        if serializer.is_valid():
            mvt = serializer.save()
            # Met à jour le solde de l'associé
            associe = mvt.associe
            if mvt.type_mvt == 'injection':
                associe.solde += mvt.montant
            else:
                associe.solde -= mvt.montant
            associe.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        mvt = get_object_or_404(MouvementCapital, pk=pk)
        # Annule l'effet sur le solde avant suppression
        associe = mvt.associe
        if mvt.type_mvt == 'injection':
            associe.solde -= mvt.montant
        else:
            associe.solde += mvt.montant
        associe.save()
        mvt.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class ParametresSocieteView(APIView):
    permission_classes = [AllowAny]

    def get(self, request):
        params = ParametresSociete.get_instance()
        return Response(ParametresSocieteSerializer(params).data)

    def patch(self, request):
        params = ParametresSociete.get_instance()
        serializer = ParametresSocieteSerializer(params, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

################## VEHICULES ################
from .models.vehicule import Vehicule, FraisVehicule
from .serializers import VehiculeSerializer, FraisVehiculeSerializer

class VehiculeList(APIView):
    permission_classes = [AllowAny]

    def get(self, request):
        vehicules = Vehicule.objects.prefetch_related('frais').all().order_by('-date_creation')
        return Response(VehiculeSerializer(vehicules, many=True).data)

    def post(self, request):
        serializer = VehiculeSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class VehiculeDetail(APIView):
    permission_classes = [AllowAny]

    def get(self, request, pk):
        v = get_object_or_404(Vehicule, pk=pk)
        return Response(VehiculeSerializer(v).data)

    def patch(self, request, pk):
        v = get_object_or_404(Vehicule, pk=pk)
        serializer = VehiculeSerializer(v, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        v = get_object_or_404(Vehicule, pk=pk)
        v.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class FraisVehiculeList(APIView):
    permission_classes = [AllowAny]

    def post(self, request):
        serializer = FraisVehiculeSerializer(data=request.data)
        if serializer.is_valid():
            frais = serializer.save()
            # Déduire le frais du solde bancaire
            from .models.capital import ParametresSociete as PS
            params, _ = PS.objects.get_or_create(pk=1)
            params.solde_bancaire = (params.solde_bancaire or 0) - frais.prix
            params.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class FraisVehiculeDetail(APIView):
    permission_classes = [AllowAny]

    def patch(self, request, pk):
        f = get_object_or_404(FraisVehicule, pk=pk)
        ancien_prix = f.prix
        serializer = FraisVehiculeSerializer(f, data=request.data, partial=True)
        if serializer.is_valid():
            frais = serializer.save()
            # Ajuster le solde bancaire si le prix a changé
            nouveau_prix = frais.prix
            diff = nouveau_prix - ancien_prix
            if diff != 0:
                from .models.capital import ParametresSociete as PS
                params, _ = PS.objects.get_or_create(pk=1)
                params.solde_bancaire = (params.solde_bancaire or 0) - diff
                params.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        f = get_object_or_404(FraisVehicule, pk=pk)
        # Rembourser le frais dans le solde bancaire
        from .models.capital import ParametresSociete as PS
        params, _ = PS.objects.get_or_create(pk=1)
        params.solde_bancaire = (params.solde_bancaire or 0) + f.prix
        params.save()
        f.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


################## FRAIS GENERAUX ################
from .models.frais import FraisGeneraux
from .serializers import FraisGenerauxSerializer

class FraisGenerauxView(APIView):
    permission_classes = [AllowAny]

    def get(self, request):
        frais = FraisGeneraux.objects.all()
        return Response(FraisGenerauxSerializer(frais, many=True, context={'request': request}).data)

    def post(self, request):
        serializer = FraisGenerauxSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            frais = serializer.save()
            # Déduire du solde bancaire
            from .models.capital import ParametresSociete as PS
            params, _ = PS.objects.get_or_create(pk=1)
            params.solde_bancaire = (params.solde_bancaire or 0) - frais.prix
            params.save()
            return Response(FraisGenerauxSerializer(frais, context={'request': request}).data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        frais = get_object_or_404(FraisGeneraux, pk=pk)
        # Rembourser dans le solde bancaire
        from .models.capital import ParametresSociete as PS
        params, _ = PS.objects.get_or_create(pk=1)
        params.solde_bancaire = (params.solde_bancaire or 0) + frais.prix
        params.save()
        frais.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
