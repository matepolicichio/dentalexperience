from django.db import models
from django.contrib.auth.models import User
from django.urls import reverse
from datetime import datetime, date
from ckeditor.fields import RichTextField

from calltoaction.models import CallToAction as Call2Action
from django.core.exceptions import ValidationError

class Page(models.Model):
    name = models.CharField(max_length=255, default="Promociones")
    description = models.TextField(null=True, blank=True)
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


class Post(models.Model):
    title = models.CharField(max_length=255)
    header_image = models.ImageField(null=True, blank=True, upload_to="images/promociones/", default=None)
    title_tag = models.CharField(max_length=255, default="Promociones")
    author = models.ForeignKey(User, related_name='promo_author', on_delete=models.CASCADE)
    body = RichTextField(blank=True, null=True)
    post_date = models.DateField(auto_now_add=True)
    snippet = models.CharField(max_length=255, null=True, blank=True)
    likes = models.ManyToManyField(User, related_name='promociones_posts_likes')
    category = models.ForeignKey(Category, on_delete=models.SET_NULL, null=True, blank=True, related_name='articles')
    tags = models.ManyToManyField(Tag, blank=True)
    sort_order = models.IntegerField(default=1)
    is_visible = models.BooleanField(default=True)
    call2action = models.ForeignKey(
        Call2Action,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='promo_call2action',
        )

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