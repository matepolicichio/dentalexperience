import os
from django.db import models
from django.conf import settings

class Contact(models.Model):
    nombre = models.CharField(max_length=100)
    email = models.EmailField()
    titulo = models.CharField(max_length=200)
    mensaje = models.TextField()

    def __str__(self):
        return self.email