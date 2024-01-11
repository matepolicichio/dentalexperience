from django.db import models
from django.core.exceptions import ValidationError

def validate_numeric_whatsapp_number(value):
    if not value.isdigit():
        raise ValidationError('WhatsApp number must contain only numeric characters.')

class CallToAction(models.Model):

    title = models.CharField(max_length=255, default="Tu Salud Bucal es Nuestra Prioridad")
    description = models.TextField(
            null=True,
            blank=True,
            default="Únete a nosotros para experimentar una odontología de calidad, personalizada y avanzada que transformará tu sonrisa y tu confianza. Nuestro equipo dedicado está aquí para cuidar de tu bienestar bucal y crear resultados que te hagan sonreír todos los días.",
            )
    
    whatsapp_number = models.CharField(
        max_length=20,
        null=True,
        blank=True,
        validators=[validate_numeric_whatsapp_number],
        default="5216869464883"
        )
    whatsapp_message = models.TextField(null=True, blank=True, default="Hola, me gustaría recibir más información...")
    btn_text = models.CharField(max_length=50, default="Agenda tu cita")

    background_image = models.ImageField(null=True, blank=True, upload_to="images/promociones/call2action/", default=None)
    is_mainpage_enabled = models.BooleanField(default=False)
 
    def __str__(self):
        return self.title
