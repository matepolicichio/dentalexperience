from django.contrib import admin
from .models import Post, PostCard, Category, Tag, Page


admin.site.register(Category)
admin.site.register(Tag)

class PageAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in Page._meta.fields]

admin.site.register(Page, PageAdmin)


class PostAdmin(admin.ModelAdmin):
    list_display = ['title',
                    'show_title',
                    'show_meta_top',
                    'title_tag',
                    'header_image',
                    'show_header_image',
                    'author',
                    'snippet',
                    'show_description',
                    'is_postcard_enabled',
                    'postcard_interval',
                    'get_postcards',
                    'show_meta_bottom',
                    'get_categories',
                    'get_tags',
                    'call2action',
                    'sort_order',
                    'is_visible',
                    'post_date',
                    ]

    # Define methods to display tags, categories, and postcards in the list display
    def get_tags(self, obj):
        return ", ".join([tag.name for tag in obj.tags.all()])

    get_tags.short_description = 'Tags'

    def get_categories(self, obj):
        return ", ".join([category.name for category in obj.category2.all()])

    get_categories.short_description = 'Categories'

    def get_postcards(self, obj):
        return ", ".join([postcard.title for postcard in obj.postcard.all()])

    get_postcards.short_description = 'Postcards'

admin.site.register(Post, PostAdmin)

class PostCardAdmin(admin.ModelAdmin):
    list_display = ['title',
                    'header_image',
                    'expiration_date',
                    'start_day',
                    'end_day',
                    'available_quantity',
                    'show_metrics',
                    'is_whatsapp_enabled',
                    'whats_number',
                    'whats_message',
                    'whats_btn_text',                 
                    'sort_order',
                    'created_at',
                    'updated_at',
                    'background_color',
                    'text_color',
                    ]

    # Define methods to display tags and categories in the list display
    def get_tags(self, obj):
        return ", ".join([tag.name for tag in obj.tags.all()])

    get_tags.short_description = 'Tags'

    def get_categories(self, obj):
        return ", ".join([category.name for category in obj.category.all()])

    get_categories.short_description = 'Categories'

admin.site.register(PostCard, PostCardAdmin)