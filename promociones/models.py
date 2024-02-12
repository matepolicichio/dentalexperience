from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from datetime import datetime, date
from ckeditor.fields import RichTextField
from colorfield.fields import ColorField

from calltoaction.models import CallToAction as Call2Action
from django.core.exceptions import ValidationError

message = """"Hola, me gustaría recibir más información sobre las *Promociones de Dental Experience*.
Enviado desde dental experience webapp https://dentalexperience.ingenios.com.ar

Pack: *...*
_Promo: ..._
https://dentalexperience.ingenios.com.ar/promociones

Muchas Gracias,"""


class Page(models.Model):
    name = models.CharField(max_length=255, default="Promociones")
    description = models.TextField(null=True, blank=True, default="Descripción de Promociones ...</p>")
    is_enabled = models.BooleanField(default=True)

    def __str__(self):
        return self.name

class Category(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Tag(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

def validate_numeric_whatsapp_number(value):
    if not value.isdigit():
        raise ValidationError('WhatsApp number must contain only numeric characters.')


class PostCard(models.Model):
    title = models.CharField(max_length=255)
    show_title = models.BooleanField(default=False)
    header_image = models.ImageField(null=True, blank=True, upload_to="images/promociones/postcard", default=None)
    body = RichTextField(blank=True, null=True)

    expiration_date = models.DateField(null=True, blank=True)
    start_day = models.IntegerField(default=1)
    end_day = models.IntegerField(default=31)

    available_quantity = models.IntegerField(default=0)
    show_metrics = models.BooleanField(default=True)


    is_whatsapp_enabled = models.BooleanField(default=True)    
    whats_number = models.CharField(
        max_length=20,
        null=True,
        blank=True,
        validators=[validate_numeric_whatsapp_number],
        default="529984899792"
        )
    whats_message = models.TextField(null=True, blank=True, default=message)
    whats_btn_text = models.CharField(max_length=255, default="Quiero esta Promo")

    sort_order = models.IntegerField(default=1)
    is_enabled = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    background_color = ColorField(default='#ffffff')  # Set a default color, pip install django-colorfield
    text_color = ColorField(default='#000000')

    def __str__(self):
        return self.title

class Post(models.Model):
    title = models.CharField(max_length=255)
    show_title = models.BooleanField(default=True)
    show_meta_top = models.BooleanField(default=True)
    title_tag = models.CharField(max_length=255, default="Promociones")
    header_image = models.ImageField(null=True, blank=True, upload_to="images/promociones/", default=None)
    show_header_image = models.BooleanField(default=True)
    author = models.ForeignKey(User, related_name='promo_author', null=True, on_delete=models.SET_NULL)
    snippet = models.CharField(max_length=255, null=True, blank=True)
    body = RichTextField(blank=True, null=True)
    show_description = models.BooleanField(default=True)
    is_postcard_enabled = models.BooleanField(default=False)
    postcard = models.ManyToManyField(PostCard, blank=True)
    postcard_interval = models.IntegerField(default=5000)
    likes = models.ManyToManyField(User, related_name='promociones_posts_likes')
    category2 = models.ManyToManyField(Category, blank=True)
    tags = models.ManyToManyField(Tag, blank=True)
    show_meta_bottom = models.BooleanField(default=True)

    call2action = models.ForeignKey(
        Call2Action,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='promo_call2action',
        )

    sort_order = models.IntegerField(default=1)
    is_visible = models.BooleanField(default=True)   
    post_date = models.DateField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title + ' | ' + str(self.author)
    
    def get_absolute_url(self):
        return reverse('promociones:home')


class Comment(models.Model):
    post = models.ForeignKey(Post, related_name='comments', on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    body = models.TextField()
    date_added = models. DateTimeField(auto_now_add=True)

    def __str__(self):
        return '%s - %s' % (self.post.title, self.name)