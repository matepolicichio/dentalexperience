from django.urls import path
from .views import testimonials_view

app_name = 'testimonials'
urlpatterns = [
    path('', testimonials_view, name='index'),
]