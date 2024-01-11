from django.contrib import admin
from .models import Hero

# Register your models here.
class HeroAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in Hero._meta.fields]

admin.site.register(Hero, HeroAdmin)
