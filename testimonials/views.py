from django.shortcuts import render
from .models import Testimonial, Page
from base.models import Header, Footer
from sectionselection.models import SectionSelection
import random
from random import choice

def testimonials_view(request):

    template_path_filter = 'testimonials/index.html'

    sections = SectionSelection.objects.filter(
        is_visible=True,
        page__template_path=template_path_filter)
    
    nav_menu = SectionSelection.objects.filter(
        nav_enabled=True)
    
    header = Header.objects.first()
    footer = Footer.objects.first()

    testimonials = Testimonial.objects.filter(is_visible=True).order_by('sort_order')

    enabled_tstmnls_page_content = Page.objects.filter(is_enabled=True)    
    tstmnls_page_random_content = None
    if enabled_tstmnls_page_content.exists():
        tstmnls_page_random_content = random.choice(enabled_tstmnls_page_content)

    context = {
        'sections': sections,
        'nav_menu': nav_menu,
        'header': header,
        'footer': footer,
        'testimonials': testimonials,
        'tstmnls_page_content': tstmnls_page_random_content,
    }

    template_name = 'testimonials/index.html'

    return render(request, template_name, context)