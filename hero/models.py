from django.db import models
from django.core.exceptions import ValidationError


message = """"Hola, me gustaría recibir más información sobre las *Promociones y Tratamientos de Dental Experience*.
Enviado desde dental experience webapp https://dentalexperience.ingenios.com.ar

Tratamiento: *...*
_Distintivo: ..._
https://dentalexperience.ingenios.com.ar/services

Pack: *...*
_Promo: ..._
https://dentalexperience.ingenios.com.ar/promociones

Muchas Gracias,"""


def validate_numeric_whatsapp_number(value):
    if not value.isdigit():
        raise ValidationError('WhatsApp number must contain only numeric characters.')

class Hero(models.Model):

    title = models.CharField(max_length=255, default="Cuidá tu sonrisa")
    description = models.TextField(
            null=True,
            blank=True,
            default="Las mejores coberturas, los mejores profesionales.<br>Elegí tu plan dental.",
            )

    background_image = models.ImageField(null=True, blank=True, upload_to="images/hero/", default=None)
    
    is_form_enabled = models.BooleanField(default=False)
    form_placeholder = models.CharField(max_length=255, default="Ingrese su email")
    form_value = models.CharField(max_length=255, default="Suscribirme")

    is_whatsapp_enabled = models.BooleanField(default=True)    
    whats_number = models.CharField(
        max_length=20,
        null=True,
        blank=True,
        validators=[validate_numeric_whatsapp_number],
        default="529984899792"
        )
    whatsapp_message = models.TextField(null=True, blank=True, default=message)
    whats_btn_text = models.CharField(max_length=255, default="Contáctanos")
    is_enabled = models.BooleanField(default=True)
 
    def __str__(self):
        return self.title