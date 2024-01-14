from django.db import models
from django.core.exceptions import ValidationError


def validate_numeric_whatsapp_number(value):
    if not value.isdigit():
        raise ValidationError('WhatsApp number must contain only numeric characters.')

class Contact(models.Model):
    nombre = models.CharField(max_length=100)
    email = models.EmailField()
    titulo = models.CharField(max_length=200)
    mensaje = models.TextField()

    def __str__(self):
        return self.email
    
class Header(models.Model):

    logo_image = models.ImageField(null=True, blank=True, upload_to="images/header/", default=None)
    logo_text = models.CharField(max_length=255, default='<div class="d-flex flex-column"><h1 class="no-margin">Dental</h1><h2 class="no-margin">EXPERIENCE</h2></div>')
    
    is_getstarted_enabled = models.BooleanField(default=False)
    getstarted_link2section = models.CharField(max_length=255, default="nosotros")
    getstarted_text = models.CharField(max_length=255, default="Comenzar")

    is_whatsapp_enabled = models.BooleanField(default=False)
    whats_number = models.CharField(
        max_length=20,
        null=True,
        blank=True,
        validators=[validate_numeric_whatsapp_number],
        default="529984899792"
        )
    whats_message = models.CharField(max_length=255, default="Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/")
    whats_btn_text = models.CharField(max_length=255, default="Contáctanos")
 
    def __str__(self):
        return "Header"