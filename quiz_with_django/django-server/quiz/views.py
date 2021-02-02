from rest_framework.response import Response
from rest_framework.decorators import api_view
from quiz.models import Quiz
from quiz.serializer import QuizSerializer
import random


@api_view(['GET'])
def helloAPI(request):
    return Response("hello wolrd!")


@api_view(['GET'])
def randomQuiz(request, id):
    totalQuizs = Quiz.objects.all()
    randomQuizs = random.sample(list(totalQuizs), id)
    serializer = QuizSerializer(randomQuizs, many=True)
    print(serializer.data)
    return Response(serializer.data)
