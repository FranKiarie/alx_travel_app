from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status

# Create your views here.

@api_view(['GET'])
def health_check(request):
    """
    Health check endpoint to verify the API is working.
    """
    return Response({
        'status': 'healthy',
        'message': 'ALX Travel App API is running successfully!',
        'version': '1.0.0'
    }, status=status.HTTP_200_OK)
