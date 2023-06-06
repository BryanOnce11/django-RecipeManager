from django.shortcuts import render,redirect
from django.db.models import Avg
from datetime import datetime
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

from .models import Users
from .models import Recipes
from .models import Categories
from .models import Favorites
from .models import RecipeReviews
# Create your views here.


def register(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']

        user = Users(user_name=username, email=email, password=password)
        user.save()

        request.session['user_id'] = user.user_id
        request.session['username'] = username
        request.session['email'] = email
        request.session['logged_in'] = True

        return redirect('login')
    else:
        return render(request, 'register.html')

def login(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']

        try:
            user = Users.objects.get(email=email, password=password)
            request.session['user_id'] = user.user_id
            request.session['email'] = email

            return redirect('index')
        except Users.DoesNotExist:
            error_message = 'Invalid email or password.'
            return render(request, 'login.html', {'error_message': error_message})
    else:
        return render(request, 'login.html')

def logout(request):
    request.session.flush()

    return redirect('login')    

def index(request):
    recipes = Recipes.objects.all()
    context = {'recipes': recipes, 'request': request}
    return render(request, 'index.html', context)

def indexx(request):
    recipes = Recipes.objects.all()
    context = {'recipes': recipes, 'request': request}
    return render(request, 'indexx.html', context)

  
def add_recipe(request):
    if request.method == 'POST':
        recipe_name = request.POST['recipe_name']
        description = request.POST['description']
        ingredients = request.POST['ingredients']
        instructions = request.POST['instructions']
        servings = request.POST['servings']
        prep_time = request.POST['prep_time']
        category_id = request.POST['category_id']
        
        user_id = request.session.get('user_id', None)
        
        image = request.FILES['image']
        recipe = Recipes(recipe_name=recipe_name, description=description, ingredients=ingredients, instructions=instructions,
                         image=image, servings=servings, prep_time=prep_time, category_id=category_id, user_id=user_id,
                         created_at=datetime.now(), updated_at=datetime.now())
        recipe.save()
        
        return redirect('index')
        
    categories = Categories.objects.all()
    return render(request, 'add-recipe.html', {'categories': categories})

def edit_recipe(request, recipe_id):
    if request.method == 'POST':
        recipe = Recipes.objects.get(recipe_id=recipe_id)
        recipe.recipe_name = request.POST['recipe_name']
        recipe.description = request.POST['description']
        recipe.prep_time = request.POST['prep_time']
        recipe.servings = request.POST['servings']
        recipe.category_id = request.POST['category_id']
        recipe.ingredients = request.POST['ingredients']
        recipe.instructions = request.POST['instructions']

        if 'new_image' in request.FILES:
            recipe.image = request.FILES['new_image']
        
        recipe.save()
        return redirect('index')
    else:
        recipe = Recipes.objects.get(recipe_id=recipe_id)
        categories = Categories.objects.all()
        context = {
            'recipe': recipe,
            'categories': categories
        }
        return render(request, 'edit-recipe.html', context)

def delete_recipe(request, recipe_id):
    if request.method == 'GET':
        recipe = Recipes.objects.get(recipe_id=recipe_id)
        recipe.delete()
        return redirect('index')
    
def recipe_categories(request):
    categories = Categories.objects.all()

    if request.method == 'POST' and 'category_id' in request.POST:
        category_id = request.POST['category_id']
        recipes = Recipes.objects.filter(category_id=category_id)
    else:
        recipes = None

    return render(request, 'categories.html', {'categories': categories, 'recipes': recipes})

@csrf_exempt
def remove_favorite(request):
    if 'user_id' not in request.session:
        return HttpResponse('Not logged in')

    user_id = request.session.get('user_id')
    recipe_id = request.POST.get('recipe_id')

    favorite = Favorites.objects.filter(user_id=user_id, recipe_id=recipe_id).first()
    if not favorite:
        return HttpResponse('Recipe is not a favorite')

    favorite.delete()
    return HttpResponse('Recipe removed from favorites')

def get_comments(recipe_id):
    return RecipeReviews.objects.filter(recipe_id=recipe_id)

@csrf_exempt
def add_favorite(request):
    if 'user_id' not in request.session:
        return HttpResponse('Not logged in')

    user_id = request.session.get('user_id')
    recipe_id = request.POST.get('recipe_id')

    favorite = Favorites.objects.filter(user_id=user_id, recipe_id=recipe_id).first()
    if favorite:
        return HttpResponse('Recipe is already a favorite')

    new_favorite = Favorites(user_id=user_id, recipe_id=recipe_id)
    new_favorite.save()
    return HttpResponse('Recipe added to favorites')

def favorites(request):
    user_id = request.session.get('user_id')

    favorites = Favorites.objects.filter(user_id=user_id)
    if favorites:
        favorite_recipes = []
        for favorite in favorites:
            recipe = Recipes.objects.get(recipe_id=favorite.recipe_id)
            rating = RecipeReviews.objects.filter(recipe_id=favorite.recipe_id, user_id=user_id).first()
            favorite_recipes.append({'recipe': recipe, 'rating': rating.rating if rating else 0})

        context = {'favorite_recipes': favorite_recipes}
        return render(request, 'favorites.html', context)
    else:
        return render(request, 'favorites.html', {'favorite_recipes': []})
    
@csrf_exempt
def add_review(request):
    if not request.session.get('user_id'):
        return redirect('index')

    user_id = request.session.get('user_id')

    if request.method == 'POST':
        recipe_id = request.POST.get('recipe_id')
        rating = request.POST.get('rating')
        comment = request.POST.get('comment')

        new_review = RecipeReviews(user_id=user_id, recipe_id=recipe_id, rating=rating, comment=comment)
        new_review.save()

        return redirect('index')
    
    recipe_id = request.GET.get('recipe_id')
    context = {'recipe_id': recipe_id}
    return render(request, 'add-review.html', context)


def profile(request):
    user_id = request.session.get('user_id')
    
    if user_id:
        user = Users.objects.get(user_id=user_id)
        recipes = Recipes.objects.filter(user_id=user_id)
        favorites = Favorites.objects.filter(user_id=user_id)
        
        context = {
            'user': user,
            'recipes': recipes,
            'favorites': favorites
        }
        return render(request, 'profile.html', context)
    else:
        return redirect('index')
    
def view_recipe_view(request, recipe_id):
    try:
        recipe = Recipes.objects.get(recipe_id=recipe_id)
    except Recipes.DoesNotExist:
        return render(request, 'view_recipe.html', {'recipe': None})

    reci_ingred = recipe.ingredients
    recisteps = recipe.instructions

    ingredients = reci_ingred.split(',')
    steps = recisteps.split(',')

    if request.session.get('user_id'):
        user_id = request.session.get('user_id')
        try:
            user_rating = RecipeReviews.objects.get(recipe_id=recipe_id, user_id=user_id).rating
        except RecipeReviews.DoesNotExist:
            user_rating = None
    else:
        user_rating = None

    avg_rating = RecipeReviews.objects.filter(recipe_id=recipe_id).aggregate(avg_rating=Avg('rating'))['avg_rating']

    context = {
        'recipe': recipe,
        'ingredients': ingredients,
        'steps': steps,
        'user_rating': user_rating,
        'avg_rating': avg_rating,
    }

    return render(request, 'view-recipe.html', context)    