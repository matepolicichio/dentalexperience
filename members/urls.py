from django.urls import path
from .views import UserRegisterView, UserEditSettingView, CustomPasswordChangeView, ShowProfileView, EditProfileView, CreateProfileView
from . import views

app_name = 'members'
urlpatterns = [
    path('register/', UserRegisterView.as_view(), name='register'),
    path('edit_setting/', UserEditSettingView.as_view(), name='edit_setting'),
    path('password/', CustomPasswordChangeView.as_view(), name='password_change'),
    path('password_success/', views.password_success, name='password_success'),
    path('<int:pk>/profile/', ShowProfileView.as_view(), name='show_profile'),
    path('<int:pk>/edit_profile', EditProfileView.as_view(), name='edit_profile'),
    path('create_profile', CreateProfileView.as_view(), name='create_profile')
]