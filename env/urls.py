# -*- coding: utf-8 -*-
#######################
# env.urls
#######################
from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('envInfo/', include("envInfo.urls")),
    path('projectInfo/', include("projectInfo.urls")),
    path('usermgt/', include("usermgt.urls")),
]
