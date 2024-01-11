from django.contrib import admin
from .models import CallToAction

# Register your models here.
class CallToActionAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in CallToAction._meta.fields]

admin.site.register(CallToAction, CallToActionAdmin)