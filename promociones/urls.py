from django.urls import path
from .views import *

app_name = 'promociones'
urlpatterns = [
    path('', HomeView, name='home'),
    path('article/<int:pk>', ArticleDetailView, name='article-detail'),
    path('add_post/', AddPostView.as_view(), name='add_post'),
    path('article/edit/<int:pk>', UpdatePostView.as_view(), name='update_post'),
    path('article/<int:pk>/remove', DeletePostView.as_view(), name='delete_post' ),
    path('like/<int:pk>', LikeView, name='like_post'),
    path('decrease_quantity/', decrease_quantity_view, name='decrease_quantity'),
]