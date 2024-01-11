from django.contrib.auth.forms import UserCreationForm, UserChangeForm, PasswordChangeForm
from django.contrib.auth.models import User
from django import forms
from .models import Profile

class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ('bio', 'profile_pic', 'website_url', 'facebook', 'instagram', 'linkedin')
        widgets = {
            'bio' : forms.Textarea(attrs={'class':'form-control'}),
            'website_url' : forms.TextInput(attrs={'class':'form-control'}),
            'facebook' : forms.TextInput(attrs={'class':'form-control'}),
            'instagram' : forms.TextInput(attrs={'class':'form-control'}),
            'linkedin' : forms.TextInput(attrs={'class':'form-control'}),
    }



class SignUpForm(UserCreationForm):
    email = forms.EmailField(widget=forms.EmailInput(
        attrs={'class': 'form-control'}))
    first_name = forms.CharField(
        max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_name = forms.CharField(
        max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2')

    def __init__(self, *args, **kwargs) -> None:
        super(SignUpForm, self).__init__(*args, **kwargs)

        self.fields['username'].widget.attrs['class'] = 'form-control'
        self.fields['password1'].widget.attrs['class'] = 'form-control'
        self.fields['password2'].widget.attrs['class'] = 'form-control'


class EditSettingForm(UserChangeForm):
    email = forms.EmailField(widget=forms.EmailInput(attrs={'class': 'form-control'}))
    first_name = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_name = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    username = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    last_login = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    # is_superuser = forms.BooleanField(widget=forms.CheckboxInput(attrs={'class': 'form-check'}))
    # is_staff = forms.BooleanField(widget=forms.CheckboxInput(attrs={'class': 'form-check'}))
    # is_active = forms.BooleanField(widget=forms.CheckboxInput(attrs={'class': 'form-ckeck'}))
    date_joined = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))

    password = forms.CharField(
        label="",
        required=False,
        widget=forms.TextInput(attrs={'hidden': 'hidden'}),
        help_text=""
    )

    class Meta:
        model = User
        fields = ('username',
                  'first_name',
                  'last_name',
                  'email',
                  'last_login',
                #   'is_superuser',
                #   'is_staff',
                #   'is_active',
                  'date_joined',
                  )


class CustomPasswordChangeForm(PasswordChangeForm):
    old_password = forms.CharField(label="Clave previa", widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'type': 'password'}))
    new_password1 = forms.CharField(label="Nueva Clave", widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'type': 'password'}))
    new_password2 = forms.CharField(label="Repetir nueva Clave", widget=forms.PasswordInput(
        attrs={'class': 'form-control', 'type': 'password'}))
    
    class Meta:
        model = User
        fields = ('old_password', 'new_password1', 'new_password2')