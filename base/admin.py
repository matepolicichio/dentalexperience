from django.contrib import admin
from .models import Header, Footer, Contact

# Register your models here.
class HeaderAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in Header._meta.fields]

admin.site.register(Header, HeaderAdmin)

# Register your models here.
class FooterAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in Footer._meta.fields]

admin.site.register(Footer, FooterAdmin)


class ContactAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in Contact._meta.fields]

admin.site.register(Contact, ContactAdmin)