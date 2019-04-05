# -*- coding: utf-8 -*-
#######################
# envInfo.urls
#######################
from django.urls import path
from envInfo import views

urlpatterns = [
    path('',views.health,name="health"),
    path('allEnv/',views.get_env_all,name="get_env_all"),
    path('env/<choose>/',views.get_env_by_choose,name="get_env_by_choose"),
    path('allHosts/',views.get_hosts_all,name="get_hosts_all"),
    path('hosts/<choose>/',views.get_hosts_by_choose,name="get_hosts_by_choose"),
    path('allDbInstance/',views.get_dbInstance_all,name="get_dbInstance_all"),
    path('dbInstance/<choose>/',views.get_dbInstance_by_choose,name="get_dbInstance_by_choose"),
    path('var/default/lists/',views.get_var_default,name="get_var_default"),
    path('var/allEnv/',views.get_var_env_all,name="get_car_env_all"),
    path('var/env/<choose>/',views.get_var_env_choose,name="get_car_env_choose"),
    path('allDrone/',views.get_drone_all,name="get_drone_all"),
    path('drone/<choose>/',views.get_drone_by_choose,name="get_drone_by_choose"),
    path('allEnvBusinessDb/',views.get_envBusinessDb_all,name="get_envBusinessDb_all"),
    path('envBusinessDb/<choose>/',views.get_envBusinessDb_choose,name="get_envBusinessDb_choose"),
    path('allEnvBusinessHost/',views.get_envBusinessHost_all,name="get_envBusinessHost_all"),
    path('envBusinessHost/<choose>/',views.get_envBusinessHost_choose,name="get_envBusinessHost_choose"),
]
