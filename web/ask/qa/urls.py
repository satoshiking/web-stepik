from . import views
from django.urls import path

urlpatterns = [
    path('', views.test, name='test'),
    path('login/', views.test, name='test'),
    path('signup/', views.test, name='test'),
    path('question/<int:section>', views.test, name='test'),
    path('ask/', views.test, name='test'),
    path('popular/', views.test, name='test'),
    path('new/', views.test, name='test')
]