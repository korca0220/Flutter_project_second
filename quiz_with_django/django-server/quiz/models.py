from django.db import models


class Quiz(models.Model):
    objects = models.Manager()
    title = models.TextField(max_length=200)
    body = models.TextField()
    answer = models.IntegerField()
