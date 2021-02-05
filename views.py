
from django.shortcuts import render, get_object_or_404
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth.models import User
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView,   
)
from .models import Post
from users.views import profile
#from blog.views import UserPostListView


def home(request):
    context = {
        'posts': Post.objects.all()
        #post nesnesini içerik olarak gönderdim
    }
    post_list = Post.objects.all()
    query = request.GET.get('q')
    if query:#arama çubuğuna değer girildi mi
        post_list = post_list.filter(
            Q(title__icontains=query) |
            Q(content__icontains=query) |
            Q(uzmanlık__icontains=query) |
            Q(author__first_name__icontains=query) |
            Q(author__last_name__icontains=query) 
        ).distinct()#bu metodla beraber aynı kayıtlar birden fazla şekilde gözükmeyecek
         

    return render(request, 'blog/home.html', context)


class PostListView(ListView):
    model = Post
    template_name = 'blog/home.html'  
    context_object_name = 'posts'
    ordering = ['-date_posted']
    #paginate_by = 5

class UserPostListView(ListView):
    model = Post
    template_name = 'blog/user_posts.html'  
    context_object_name = 'posts'
    #paginate_by = 5
    
    def get_queryset(self):
        user = get_object_or_404(User, username=self.kwargs.get('username'))
        return Post.objects.filter(author=user).order_by('title')
        
class PostDetailView(DetailView):
    model = Post
    fields = ['title', 'first_name','last_name','bio','uzmanlık','konum','date_of_birth','email_adress','date_posted']


class PostCreateView(LoginRequiredMixin, CreateView):
    model = Post
    fields = ['title','first_name','last_name','content','bio','uzmanlık','konum','date_of_birth','email_adress']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)


class PostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Post
    fields = ['title','first_name','last_name','content','bio','uzmanlık','konum','date_of_birth','email_adress']

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False


class PostDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Post
    success_url = '/'

    def test_func(self):
        post = self.get_object()
        if self.request.user == post.author:
            return True
        return False



def about(request):
    return render(request, 'blog/about.html', {'title': 'About'})