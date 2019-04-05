# -*- coding: utf-8 -*-
#######################
# projectInfo.urls
#######################
from django.urls import path,include
from projectInfo import views

urlpatterns = [
    path('', views.health,name="health"),
    path('business/all', views.get_business_all,name="get_business_all"),
    path('business/', views.get_business_choose,name="get_business_choose"),
    path('businessProject/all', views.get_businessProject_all,name="get_businessProject_all"),
    path('businessProject/', views.get_businessProject_choose,name="get_businessProject_choose"),
    path('project/all', views.get_project_all,name="get_project_all"),
    path('project/', views.get_project_choose,name="get_project_choose"),
    path('project/var/all', views.get_project_var_all,name="get_project_var_all"),
    path('project/var/', views.get_project_var_choose,name="get_project_var_choose"),
]
