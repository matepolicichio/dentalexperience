from django.db import models

class SectionEnabled(models.Model):
    SECTION_CHOICES = [
        ('base/section/about.html', 'main - nosotros'),
        ('base/section/contact.html', 'main - contacto'),
        ('base/section/faq.html', 'main - preguntas frecuentes'),
        ('base/section/features.html', 'main - distintivos'),
        ('base/section/portfolio.html', 'main - experiencia'),
        ('base/section/stats.html', 'main - estadísticas'),
        ('base/section/team.html', 'main - equipo'),
        ('base/section/testimonials.html', 'main - testimonios'),
        ('hero/section/hero.html', 'hero'),
        ('calltoaction/section/call2action.html', 'calltoaction'),
        ('promociones/section/posts.html', 'promociones - listado'),
        ('services/section/posts.html', 'servicios - listado'),
    ]

    name = models.CharField(max_length=255)
    html_id = models.CharField(max_length=255, unique=True)
    section_path = models.CharField(max_length=255, choices=SECTION_CHOICES, unique=True)

    def __str__(self):
        return f"{self.get_section_path_display()}"


class PageEnabled(models.Model):
    TEMPLATE_CHOICES = [
        ('base/index.html', 'base - mainpage'),
        ('services/home.html', 'servicios - listado'),
        ('services/article_details.html', 'servicios - detalle'),
        ('promociones/home.html', 'promociones - listado'),
        ('promociones/article_details.html', 'promociones - detalle'),
    ]

    name = models.CharField(max_length=255)
    template_path = models.CharField(max_length=255, choices=TEMPLATE_CHOICES, unique=True)
    section_selection = models.ManyToManyField(SectionEnabled, through='SectionSelection')

    def __str__(self):
        return f"{self.get_template_path_display()}"


class SectionSelection(models.Model):
    page = models.ForeignKey(PageEnabled, on_delete=models.CASCADE)
    section = models.ForeignKey(SectionEnabled, on_delete=models.CASCADE)
    sort_order = models.IntegerField()
    is_visible = models.BooleanField(default=True)
    nav_enabled = models.BooleanField(default=False)

    class Meta:
        ordering = ['sort_order']
        # Ensure that the combination of 'page' and 'section' is unique
        unique_together = ['page', 'section']