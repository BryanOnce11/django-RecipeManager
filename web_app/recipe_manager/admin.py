from django.contrib import admin
from .models import Categories,Favorites,RecipeReviews,Recipes,Users
# Register your models here.

admin.site.register(Categories)
admin.site.register(Favorites)
admin.site.register(RecipeReviews)
admin.site.register(Recipes)
admin.site.register(Users)


