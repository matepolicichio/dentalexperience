from django.contrib import admin
from .models import Testimonial, Page

class PageAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in Page._meta.fields]

admin.site.register(Page, PageAdmin)

class TestimonialAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in Testimonial._meta.fields]

admin.site.register(Testimonial, TestimonialAdmin)
