# -*- coding: utf-8 -*-
#######################
# env.urls
#######################
from django.contrib import admin
from django.urls import path,include
from env import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('envInfo/', include("envInfo.urls")),
    path('projectInfo/', include("projectInfo.urls")),
    path('usermgt/', include("usermgt.urls")),
    path('env/<UUID>/', views.get_env_uuid,name="get_env_uuid"),
    path('env/all/donotoftenusethis/',views.get_all,name="get_all"),
]
