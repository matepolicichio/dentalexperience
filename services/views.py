import os
from django.shortcuts import render, get_object_or_404
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from .models import Post, Category, Tag, Page
from sectionselection.models import SectionSelection
from calltoaction.models import CallToAction
from .forms import PostForm
from django.urls import reverse_lazy, reverse
from django.http import HttpResponse, HttpResponseRedirect
# from django.conf import settings
from django.http import JsonResponse
import random
from random import choice


def HomeView(request):

    template_path_filter = 'services/home.html'

    sections = SectionSelection.objects.filter(
        is_visible=True,
        page__template_path=template_path_filter)
    
    posts = Post.objects.filter(is_visible=True).order_by('sort_order')
    
    enabled_calltoaction = CallToAction.objects.filter(is_mainpage_enabled=True)
    calltoaction = choice(enabled_calltoaction) if enabled_calltoaction.exists() else None

    enabled_service_page_content = Page.objects.filter(is_enabled=True)    
    service_page_random_content = None
    if enabled_service_page_content.exists():
        service_page_random_content = random.choice(enabled_service_page_content)

    context = {
        'sections': sections,
        'service_posts': posts,
        'calltoaction': calltoaction,
        'service_page_content': service_page_random_content,
    }

    template_name = 'services/home.html'

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
    template_path_filter = 'services/article_details.html'

    sections = SectionSelection.objects.filter(
        is_visible=True,
        page__template_path=template_path_filter)

    post = get_object_or_404(Post, pk=pk)
    posts = Post.objects.filter(is_visible=True).order_by('-post_date')

    calltoaction = None
    if post.call2action:
        calltoaction = get_object_or_404(CallToAction, id=post.call2action.id)  

    categories = Category.objects.all()
    category_counts = {category.name: category.articles.count() for category in categories}
    
    tags = Tag.objects.all()

    enabled_service_page_content = Page.objects.filter(is_enabled=True)    
    service_page_random_content = None
    if enabled_service_page_content.exists():
        service_page_random_content = random.choice(enabled_service_page_content)

    context = {
        'sections': sections,
        'post': post,
        'service_posts': posts,
        'calltoaction': calltoaction,        
        'category_counts': category_counts,
        'tags': tags,
        'service_page_content': service_page_random_content,
    }

    template_name = 'services/article_details.html'

    return render(request, template_name, context)


class AddPostView(CreateView):
    model = Post
    form_class = PostForm
    template_name = 'services/add_post.html'

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

class UpdatePostView(UpdateView):
    model = Post
    form_class = PostForm
    template_name = 'services/update_post.html'

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
    template_name = 'services/delete_post.html'
    success_url = reverse_lazy('services:home')