# -*- coding: utf-8 -*-
#######################
# projectInfo.views
#######################

from django.http import HttpResponse
from common.dealWith import deal_with,deal_with_param

# projectInfo/health
def health(request):
    return HttpResponse("<h1>Yes, We Can!<h1>")

# projectInfo/business/all
def get_business_all(request):
   column=("id","name","en_name","qa_leader")
   sql="""select {param} from business""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# projectInfo/business
def get_business_choose(request):
   column=("id","name","en_name","qa_leader")
   sql="""select {param} from business""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# projectInfo/businessProject/all
def get_businessProject_all(request):
   column=("id","business_id","project_id")
   sql="""select {param} from business_project""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# projectInfo/businessProject
def get_businessProject_choose(request):
   column=("id","business_id","project_id")
   sql="""select {param} from business_project""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# projectInfo/project/all
def get_project_all(request):
   column=("id","business","name","owner","qa","gitpath","domainname","domainname_exp","mgt_port","listen_port","code_type","deploy_type","level","type","status","config_name","config_token")
   sql="""select {param} from project""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# projectInfo/project
def get_project_choose(request):
   column=("id","business","name","owner","qa","gitpath","domainname","domainname_exp","mgt_port","listen_port","code_type","deploy_type","level","type","status","config_name","config_token")
   sql="""select {param} from project""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# projectInfo/project/var/all
def get_project_var_all(request):
   column=("id","project_id","dict_key","value")
   sql="""select {param} from project_var""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# projectInfo/project/var
def get_project_var_choose(request):
   column=("id","project_id","dict_key","value")
   sql="""select {param} from project_var""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


