from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

from PIL import Image
from django.urls import reverse


class Post(models.Model):
    title = models.CharField(max_length=100,verbose_name='Sicil Numaranız')
    first_name = models.CharField(max_length=15,verbose_name='Ad:')
    last_name = models.CharField(max_length=30,verbose_name='Soyad:')
    bio = models.TextField(verbose_name='Biografi')
    uzmanlık=models.CharField(max_length=500,verbose_name='Uzmanlık Alanları')
    konum=models.CharField(max_length=150,verbose_name='Konum')
    date_posted = models.DateTimeField(default=timezone.now,verbose_name='Yayınlanma Tarihi')
    author = models.ForeignKey(User, on_delete=models.CASCADE,verbose_name='Avukat Adı')
    date_of_birth=models.DateField(auto_now=False, auto_now_add=False,verbose_name='Doğum Tarihi',null=True,blank =True)
    email_adress=models.EmailField(max_length=254,verbose_name='Email adresi')
    #image = models.ImageField(null=True,blank =True)
    content = models.TextField(verbose_name = 'İlgi Alanları / Hobiler ',null=True,blank =True)
    
    #string döndürür admin panelinde görmeni sağlar
    def __str__(self):
        return self.title
    def get_absolute_url(self):
        return reverse('post-detail', kwargs={'pk': self.pk})