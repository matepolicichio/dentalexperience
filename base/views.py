from django.shortcuts import render
from .forms import ContactForm
from promociones.models import Post as PromoPost
from promociones.models import Page as PromoPage
from sectionselection.models import SectionEnabled
from hero.models import Hero
from calltoaction.models import CallToAction
from services.models import Post as ServicePost
from services.models import Page as ServicePage
from sectionselection.models import SectionSelection
import random
from random import choice

# Create your views here.
def index(request):
    
    template_path_filter = 'base/index.html'

    sections = SectionSelection.objects.filter(
        is_visible=True,
        page__template_path=template_path_filter)
    
    promo_posts = PromoPost.objects.filter(is_visible=True).order_by('-post_date')
    service_posts = ServicePost.objects.filter(is_visible=True).order_by('-post_date')

    enabled_calltoaction = CallToAction.objects.filter(is_mainpage_enabled=True)
    calltoaction = choice(enabled_calltoaction) if enabled_calltoaction.exists() else None

    enabled_hero = Hero.objects.filter(is_enabled=True)
    hero = choice(enabled_hero) if enabled_hero.exists() else None

    enabled_promo_page_content = PromoPage.objects.filter(is_enabled=True)
    promo_page_random_content = None
    if enabled_promo_page_content.exists():
        promo_page_random_content = random.choice(enabled_promo_page_content)

    enabled_service_page_content = ServicePage.objects.filter(is_enabled=True)    
    service_page_random_content = None
    if enabled_service_page_content.exists():
        service_page_random_content = random.choice(enabled_service_page_content)


    context = {
        'sections': sections,
        'hero': hero,
        'promo_posts': promo_posts,
        'service_posts': service_posts,
        'calltoaction': calltoaction,
        'promo_page_content': promo_page_random_content,
        'service_page_content': service_page_random_content,        
    }

    template_name = 'base/index.html'

    if request.method == 'POST':
        form = ContactForm(request.POST)
        if form.is_valid():
            form.save()
            context['sent_message'] = True
            return render(request, template_name, context)
    else:
        form = ContactForm()
    
    context['form'] = form

    return render(request, template_name, context)
