# from django.shortcuts import render
# Create your views here.
from django.http import HttpRequest, HttpResponse,HttpResponseBadRequest, JsonResponse
import simplejson

def reg(request: HttpRequest):
    print(request.body)
    print(request.headers)
    print("nihao!")
    return JsonResponse({"message": "提交成功！"})