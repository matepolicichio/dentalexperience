from django.contrib import admin
from .models import Header, Contact

# Register your models here.
class HeaderAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in Header._meta.fields]

admin.site.register(Header, HeaderAdmin)

class ContactAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in Contact._meta.fields]

admin.site.register(Contact, ContactAdmin)