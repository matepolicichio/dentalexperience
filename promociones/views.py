import os
from django.shortcuts import render, get_object_or_404
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from .models import Post, Category, Tag, Page, PostCard
from base.models import Header, Footer
from sectionselection.models import SectionSelection
from calltoaction.models import CallToAction
from .forms import PostForm
from django.urls import reverse_lazy, reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

import random
from random import choice

import datetime
from datetime import date


def HomeView(request):

    template_path_filter = 'promociones/home.html'

    sections = SectionSelection.objects.filter(
        is_visible=True,
        page__template_path=template_path_filter)
    
    nav_menu = SectionSelection.objects.filter(
        nav_enabled=True)
    
    header = Header.objects.first()    
    footer = Footer.objects.first()    

    posts = Post.objects.filter(is_visible=True).order_by('sort_order')
    
    enabled_calltoaction = CallToAction.objects.filter(is_mainpage_enabled=True)
    calltoaction = choice(enabled_calltoaction) if enabled_calltoaction.exists() else None

    enabled_promo_page_content = Page.objects.filter(is_enabled=True)
    promo_page_random_content = None
    if enabled_promo_page_content.exists():
        promo_page_random_content = random.choice(enabled_promo_page_content)


    context = {
        'sections': sections,
        'nav_menu': nav_menu,
        'header': header,
        'footer': footer,
        'promo_posts': posts,
        'calltoaction': calltoaction,
        'promo_page_content': promo_page_random_content,        
    }

    template_name = 'promociones/home.html'

    return render(request, template_name, context)


def LikeView(request, pk):
    post = get_object_or_404(Post, id=request.POST.get('post_id'))
    if post.likes.filter(id=request.user.id).exists():
        post.likes.remove(request.user)
    else:
        post.likes.add(request.user)

    likes_count = post.likes.count()

    # Return JSON response with updated like count
    return JsonResponse({'likes_count': likes_count})


def ArticleDetailView(request, pk):
    template_path_filter = 'promociones/article_details.html'

    sections = SectionSelection.objects.filter(
        is_visible=True,
        page__template_path=template_path_filter)

    nav_menu = SectionSelection.objects.filter(
        nav_enabled=True)

    header = Header.objects.first()
    footer = Footer.objects.first()  

    post = get_object_or_404(Post, pk=pk)
    posts = Post.objects.filter(is_visible=True).order_by('sort_order')

    calltoaction = None
    if post.call2action:
        calltoaction = get_object_or_404(CallToAction, id=post.call2action.id)

    enabled_promo_page_content = Page.objects.filter(is_enabled=True)    
    promo_page_random_content = None
    if enabled_promo_page_content.exists():
        promo_page_random_content = random.choice(enabled_promo_page_content)

    today = date.today()
    last_day_of_this_month = (today.replace(day=1) + datetime.timedelta(days=32)).replace(day=1) - datetime.timedelta(days=1)

    # Check if user is authenticated and part of staff
    if request.user.is_authenticated and request.user.is_staff:
        postcards = post.postcard.filter(is_enabled=True).order_by('sort_order')
    else:
        postcards = post.postcard.filter(
            is_enabled=True,
            expiration_date__gte=today,
            start_day__lte=today.day,
            end_day__gte=today.day,
            available_quantity__gt=0,
        ).order_by('sort_order')

    for postcard in postcards:
        if postcard.start_day <= today.day <= postcard.end_day:
            postcard.expiration_days = min(last_day_of_this_month.day, postcard.end_day) - today.day
        else:
            postcard.expiration_days = 0

    context = {
        'sections': sections,
        'nav_menu': nav_menu,
        'header': header,
        'footer': footer,
        'post': post,
        'promo_posts': posts,
        'calltoaction': calltoaction,
        'promo_page_content': promo_page_random_content,
        'postcards': postcards,
        'today': today,
    }

    template_name = 'promociones/article_details.html'

    return render(request, template_name, context)


@csrf_exempt
def decrease_quantity_view(request):
    if request.method == 'POST':
        postcard_id = request.POST.get('postcard_id')
        if postcard_id:
            try:
                postcard = PostCard.objects.get(pk=postcard_id)
                # Decrease the available_quantity based on frequency_whats_clic
                postcard.available_quantity -= 1
                # Ensure available_quantity does not go below zero
                postcard.available_quantity = max(postcard.available_quantity, 0)
                postcard.save()
                return JsonResponse({'success': True, 'quantity': postcard.available_quantity})
            except PostCard.DoesNotExist:
                return JsonResponse({'success': False, 'error': 'PostCard does not exist'}, status=404)
    return JsonResponse({'success': False, 'error': 'Invalid request'}, status=400)





class AddPostView(CreateView):
    model = Post
    form_class = PostForm
    template_name = 'promociones/add_post.html'

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

class UpdatePostView(UpdateView):
    model = Post
    form_class = PostForm
    template_name = 'promociones/update_post.html'

    def form_valid(self, form):
        # Get the existing post object
        post = get_object_or_404(Post, pk=self.kwargs['pk'])
  
        # Check if 'header_image' is in form.changed_data, meaning it's changed
        if 'header_image' in form.changed_data:
            # Check if 'header_image-clear' exists in form.cleaned_data
            if form.cleaned_data.get('header_image-clear'):
                # Clearing the selection, delete the existing image
                if post.header_image:
                    old_image_path = post.header_image.path
                    if os.path.exists(old_image_path):
                        os.remove(old_image_path)
                # Set header_image to None in case the field is not required
                post.header_image = None
            else:
                # A new image was uploaded, delete the old image if it exists
                if post.header_image:
                    old_image_path = post.header_image.path
                    if os.path.exists(old_image_path):
                        os.remove(old_image_path)
        

        # Save the form with commit=True to update the database
        form.save()

        return super().form_valid(form)


class DeletePostView(DeleteView):
    model = Post
    template_name = 'promociones/delete_post.html'
    success_url = reverse_lazy('promociones:home')