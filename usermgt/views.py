# -*- coding: utf-8 -*-
#######################
# usermgt.views
#######################
from django.http import HttpResponse
from common.dealWith import deal_with,deal_with_param

# usermgt/health
def health(request):
    return HttpResponse("<h1>Yes, We Can!<h1>")


# usermgt/allGroup
def get_group_all(request):
   column=("id","groupname","business","leader","roles")
   sql="""select {param} from group_name""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# usermgt/group/<choose>
def get_group_choose(request,choose):
   column=("id","group_name","business","leader","roles")
   sql="""select {param} from group""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# usermgt/allUser
def get_user_all(request):
   column=("id","login_name","real_name","email","token","roles","groupname","type","overlap_business","overlap_env")
   sql="""select {param} from user""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# usermgt/user/<choose>
def get_user_choose(request,choose):
   column=("id","login_name","real_name","email","token","roles","groupname","type","overlap_business","overlap_env")
   sql="""select {param} from user""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))


# usermgt/allOpType/
def get_opType_all(request):
   column=("id","query","config","created","deleted","build","rebuild","cancel","sync","login","role")
   sql="""select {param} from op_type""".format(param=','.join(column))
   return HttpResponse(deal_with(column,sql))


# usermgt/opType/<choose>
def get_opType_choose(request,choose):
   column=("id","query","config","created","deleted","build","rebuild","cancel","sync","login","role")
   sql="""select {param} from op_type""".format(param=','.join(column))
   return HttpResponse(deal_with_param(request,column,sql,choose))
