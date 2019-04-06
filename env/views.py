# -*- coding: utf-8 -*-
#######################
# env.views
#######################
# import uuid  #uuid4
import json,requests
from django.http import HttpResponse
from django.http import HttpResponseRedirect,HttpRequest

# env/health
def health(request):
    return HttpResponse("<h1>Yes, We Can!<h1>")


# get record
def __get_uri_info(uri):
    record_info=requests.get(uri).json()
    return record_info["data"]

# get envInfo
def __get_envInfo(request,UUID):
    uri=request.build_absolute_uri("/envInfo/env/UUID/?UUID={UUID}".format(UUID=UUID))
    return __get_uri_info(uri)[0]


# get dbInfo
def __get_dbInfo(request,env):
   uri=request.build_absolute_uri("/envInfo/envBusinessDb/env/?env={env}".format(env=env))
   records=__get_uri_info(uri)
   dbInfo={}
   for record in records:
       business,db_url=record["business"],record["db_url"]
       uri=request.build_absolute_uri("/envInfo/dbInstance/db_url/?db_url={db_url}".format(db_url=db_url))
       dbInfo[business]=__get_uri_info(uri)[0]
   return dbInfo

# get hostsInfo
def __get_hostsInfo(request,env):
   uri=request.build_absolute_uri("/envInfo/envBusinessHost/env/?env={env}".format(env=env))
   records=__get_uri_info(uri)
   hostsInfo={}
   for record in records:
       business,host=record["business"],record["host"]
       uri=request.build_absolute_uri("/envInfo/hosts/host/?host={host}".format(host=host))
       hostsInfo[business]=__get_uri_info(uri)[0]
   return hostsInfo


# env/<UUID>/
def get_env_uuid(request,UUID):
   infos={"status":True,"envInfo":[],"hosts":[],"db":[],"message":""}
   # infos["envInfo"]
   envInfo=requests.get(request.build_absolute_uri("/envInfo/env/UUID/?UUID={UUID}".format(UUID=UUID))).json()
   infos["envInfo"]=envInfo["data"]
   if len(infos["envInfo"])==0:
       infos["status"]=False
       infos["db"]=[]
       infos["hosts"]=[]
       infos["message"]="According to UUID not find any env!"
   else:
       env=infos["envInfo"][0]["name"]
   
       # infos["db"]
       infos["db"]=__get_dbInfo(request,env)

       # infos["hosts"]
       infos["hosts"]=__get_hostsInfo(request,env)

   return HttpResponse(json.dumps(infos))


# env/all/donotoftenusethis
def get_all(request):
   uri=request.build_absolute_uri("/envInfo/allEnv/")
   records=requests.get(uri).json()
   infos={"status":False,"data":[],"message":""}
   if len(records["data"])==0:
       infos["message"]="Could not find any records from env table!"
   else:
       datas={}
       infos["message"]="successful"
       for record in records["data"]:
           uri=request.build_absolute_uri("/env/{UUID}/".format(UUID=record["UUID"]))
           datas[record["name"]]=requests.get(uri).json()
       infos["data"]=datas
   return HttpResponse(json.dumps(infos))
