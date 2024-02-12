from django.db import models

class Page(models.Model):
    name = models.CharField(max_length=255, default="Testimonios")
    description = models.TextField(null=True, blank=True, default="<p>Descubre las experiencias reales de <span>nuestros pacientes</span></p>")
    is_enabled = models.BooleanField(default=True)

    def __str__(self):
        return self.name

class Testimonial(models.Model):
    title = models.CharField(max_length=100, default="Testimonio")
    description = models.TextField(null=True, blank=True, default="Descripción del testimonio")
    iframe_code = models.TextField(null=True, blank = True)

    def __str__(self):
        return self.title


    sort_order = models.IntegerField(default=1)
    is_visible = models.BooleanField(default=True)   
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title