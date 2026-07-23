import jwt
from django.conf import settings
from django.http import JsonResponse

# Chemins toujours publics, quelle que soit la méthode HTTP
PUBLIC_PATHS = {
    '/transcript/auth/google/',
    '/transcript/create-stripe-session/',
}

# Préfixes toujours publics (ex: suivi de commande par un client externe)
PUBLIC_PREFIXES = (
    '/transcript/commande/suivi/',
)

# Endpoints publics uniquement en POST (formulaire client externe),
# mais protégés en GET/PUT/DELETE (utilisés en interne)
PUBLIC_POST_PATHS = {
    '/transcript/client/',
    '/transcript/commande/',
}


class GoogleAuthMiddleware:
    """Protège les endpoints /transcript/ derrière une connexion Google autorisée."""

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        path = request.path

        if (
            request.method == 'OPTIONS'
            or not path.startswith('/transcript/')
            or path in PUBLIC_PATHS
            or path.startswith(PUBLIC_PREFIXES)
            or (request.method == 'POST' and path in PUBLIC_POST_PATHS)
        ):
            return self.get_response(request)

        auth_header = request.headers.get('Authorization', '')
        if not auth_header.startswith('Bearer '):
            return JsonResponse({'detail': 'Authentification requise.'}, status=401)

        token = auth_header.split(' ', 1)[1]
        try:
            payload = jwt.decode(token, settings.SECRET_KEY, algorithms=['HS256'])
        except jwt.PyJWTError:
            return JsonResponse({'detail': 'Session invalide, reconnectez-vous.'}, status=401)

        if payload.get('email', '').lower() not in settings.GOOGLE_ALLOWED_EMAILS:
            return JsonResponse({'detail': 'Accès non autorisé.'}, status=403)

        request.user_email = payload.get('email')
        return self.get_response(request)
