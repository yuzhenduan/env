# -*- coding: utf-8 -*-
#######################
# usermgt.urls
#######################
from django.urls import path
from usermgt import views

urlpatterns = [
    path('', views.health,name="health"),
    path('allGroup/', views.get_group_all,name="get_group_all"),
    path('group/<choose>/', views.get_group_choose,name="get_group_choose"),
    path('allUser/', views.get_user_all,name="get_user_all"),
    path('user/<choose>/', views.get_user_choose,name="get_user_choose"),
    path('allOpType/', views.get_opType_all,name="get_opType_all"),
    path('opType/<choose>/', views.get_opType_choose,name="get_opType_choose"),
]
