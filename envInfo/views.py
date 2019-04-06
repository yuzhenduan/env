# -*- coding: utf-8 -*-
#######################
# envInfo.views
#######################

from django.http import HttpResponse
from common.dealWith import deal_with,deal_with_param

# envInfo/health
def health(request):
    return HttpResponse("<h1>Yes, We Can!<h1>")

# envInfo/allEnv
def get_env_all(request):
   column=("id","UUID","name","lock_deploy","lock_sync","in_use","set_nginx","owner","monitor","dingding_token")
   sql="""select {param} from env""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))
   

# envInfo/env/<choose>
def get_env_by_choose(request,choose):
   column=("id","UUID","name","lock_deploy","lock_sync","in_use","set_nginx","owner","monitor","dingding_token")
   sql="""select {param} from env""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))

# envInfo/allHosts
def get_hosts_all(request):
   column=("id","hostname","host","status","type","set_nginx","nginx_parent")
   sql="""select {param} from hosts""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# envInfo/hosts/<choose>
def get_hosts_by_choose(request,choose):
   column=("id","hostname","host","status","type","set_nginx","nginx_parent")
   sql="""select {param} from hosts""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# envInfo/allDbInstance
def get_dbInstance_all(request):
   column=("id","host","port","db_url","username","groupname","owner","type","monitor","locked")
   sql="""select {param} from db_instance""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# envInfo/dbInstance/<choose>
def get_dbInstance_by_choose(request,choose):
   column=("id","host","port","db_url","username","groupname","owner","type","monitor","locked")
   sql="""select {param} from db_instance""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# envInfo/var/default/lists
def get_var_default(request):
   column=("id","dict_key","value","zone")
   sql="""select {param} from defaults""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# envInfo/var/allEnv
def get_var_env_all(request):
   column=("id","env","dict_key","value")
   sql="""select {param} from env_var""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# envInfo/var/env/<choose>
def get_var_env_choose(request,choose):
   column=("id","env","dict_key","value")
   sql="""select {param} from env_var""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# envInfo/allDrone
def get_drone_all(request):
   column=("id","env","business","short_name","hostname","ipv4","type")
   sql="""select {param} from drone""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# envInfo/drone/<choose>
def get_drone_by_choose(request,choose):
   column=("id","env","business","short_name","hostname","ipv4","type")
   sql="""select {param} from drone""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# envInfo/allEnvBusinessDb
def get_envBusinessDb_all(request):
   column=("id","env","business","db_url","status")
   sql="""select {param} from env_business_db""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# envInfo/envBusinessDb/<choose>
def get_envBusinessDb_choose(request,choose):
   column=("id","env","business","db_url","status")
   sql="""select {param} from env_business_db""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# envInfo/allEnvBusinessHost
def get_envBusinessHost_all(request):
   column=("id","env","business","host","status")
   sql="""select {param} from env_business_host""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# envInfo/envBusinessHost/<choose>
def get_envBusinessHost_choose(request,choose):
   column=("id","env","business","host","status")
   sql="""select {param} from env_business_host""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))

