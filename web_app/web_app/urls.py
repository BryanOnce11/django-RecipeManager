"""
URL configuration for web_app project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from recipe_manager.views import register,login,logout,index,indexx,add_recipe,recipe_categories,edit_recipe,delete_recipe,add_favorite,remove_favorite,favorites,add_review,profile,view_recipe_view

urlpatterns = [
        path('admin/', admin.site.urls),
        path('', login, name='root'), 
        path('register/', register, name='register'),
        path('login/', login, name='login'),
        path('logout/', logout, name='logout'),
        path('index/', index, name='index'),
        path('indexx/', indexx, name='index1'),
        path('add-recipe/', add_recipe, name='add_recipe'),
        path('categories/', recipe_categories, name='categories'),
        path('edit-recipe/<int:recipe_id>/', edit_recipe, name='edit_recipe'),
        path('delete-recipe/<int:recipe_id>/', delete_recipe, name='delete_recipe'),
        path('add-favorite/', add_favorite, name='add_favorite'),
        path('remove-favorite/', remove_favorite, name='remove_favorite'),
        path('favorites/', favorites, name='favorites'),
        path('add-review/', add_review, name='add_review'),
        path('profile/', profile, name='profile'),
        path('view-recipe/<int:recipe_id>/', view_recipe_view, name='view_recipe'),
] 
    
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
