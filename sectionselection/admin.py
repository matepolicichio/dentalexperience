from django.contrib import admin
from .models import PageEnabled, SectionEnabled, SectionSelection

class PageEnabledAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in PageEnabled._meta.fields]

admin.site.register(PageEnabled, PageEnabledAdmin)


class SectionEnabledAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in SectionEnabled._meta.fields]

admin.site.register(SectionEnabled, SectionEnabledAdmin)


class SectionSelectionAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in SectionSelection._meta.fields]

admin.site.register(SectionSelection, SectionSelectionAdmin)