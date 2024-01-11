from django.forms.models import BaseModelForm
from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404
from django.views import generic
from django.contrib.auth.forms import UserCreationForm, UserChangeForm, PasswordChangeForm
from django.contrib.auth.views import PasswordChangeView
from django.urls import reverse_lazy
from .forms import SignUpForm, EditSettingForm, CustomPasswordChangeForm, ProfileForm
from django.views.generic import DetailView, CreateView
from .models import Profile
from django.conf import settings

class CreateProfileView(CreateView):
    model = Profile
    form_class = ProfileForm
    template_name = "registration/create_user_profile.html"

    def form_valid(self, form: BaseModelForm) -> HttpResponse:
        form.instance.user = self.request.user
        return super().form_valid(form)
    

class EditProfileView(generic.UpdateView):
     model = Profile
     template_name = 'registration/edit_profile.html'
     form_class = ProfileForm
     success_url = reverse_lazy('blog:home')


class ShowProfileView(DetailView):
    model = Profile
    template_name = 'registration/user_profile.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['MEDIA_URL'] = settings.MEDIA_URL
        return context

    # def get_context_data(self, **kwargs) -> dict[str]:
    #     context = super(ShowProfileView, self).get_context_data(**kwargs)
    #     page_user = get_object_or_404(Profile, id=self.kwargs['pk'])
    #     context["page_user"]= page_user
    #     return context

class UserRegisterView(generic.CreateView):
    form_class = SignUpForm
    template_name = 'registration/register.html'
    success_url = reverse_lazy('blog:home')


class UserEditSettingView(generic.UpdateView):
    form_class = EditSettingForm
    template_name = 'registration/edit_setting.html'
    success_url = reverse_lazy('blog:home')

    def get_object(self):
        return self.request.user
    
class CustomPasswordChangeView(PasswordChangeView):
    form_class = CustomPasswordChangeForm
    template_name = 'registration/change-password.html'
    success_url = reverse_lazy('members:password_success')

def password_success(request):
    return render(request, 'registration/password_success.html')





