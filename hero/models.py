from django.db import models
from django.core.exceptions import ValidationError

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

    is_whatsapp_enabled = models.BooleanField(default=False)    
    whats_number = models.CharField(
        max_length=20,
        null=True,
        blank=True,
        validators=[validate_numeric_whatsapp_number],
        default="5216869464883"
        )
    whats_message = models.CharField(max_length=255, default="Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/")
    whats_btn_text = models.CharField(max_length=255, default="Contáctanos")
    is_enabled = models.BooleanField(default=True)
 
    def __str__(self):
        return self.title