from django import template
from recipe_manager.models import RecipeReviews
from django.db.models import Avg

register = template.Library()



@register.simple_tag
def get_user_rating(recipe_id, user_id):
    try:
        review = RecipeReviews.objects.get(recipe_id=recipe_id, user_id=user_id)
        return review.rating
    except RecipeReviews.DoesNotExist:
        return None

@register.simple_tag
def get_average_rating(recipe_id):
    avg_rating = RecipeReviews.objects.filter(recipe_id=recipe_id).aggregate(Avg('rating'))
    return int(avg_rating['rating__avg']) if avg_rating['rating__avg'] else None

@register.simple_tag
def get_comments(recipe_id):
    comments = RecipeReviews.objects.filter(recipe_id=recipe_id).order_by('-created_at')[:3]
    return comments
