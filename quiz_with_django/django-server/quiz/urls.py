from django.urls import path, include
from quiz.views import helloAPI, randomQuiz


urlpatterns = [
    path("hello/", helloAPI),
    path("<int:id>/", randomQuiz)
]
