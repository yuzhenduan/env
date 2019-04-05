# -*- coding: utf-8 -*-
#######################
# common.dealWith
#######################

import json
from common.models import query
from common.query2json import infos2json

# deal infos
def __deal_infos(infos,col):
    if infos["status"]:
        if len(infos["data"])==0:
            infos["message"]="No record was found!"
        else:
            infos["data"]=infos2json(infos["data"],col)
    else:
        infos["message"]="Maybe there is a problem with SQL!"
    return infos


# deal with no param
def deal_with(col,sql):
    infos=__deal_infos(query(sql),col)
    return json.dumps(infos)


# deal with param, only one param
def deal_with_param(request,col,sql,choose):
    if choose not in col:
        infos={"status":False,"data":[],"message":"Could not find key={choose}, Please choose one from {col}".format(choose=choose,col=col)}
    else:
        try:
            value=request.GET.get(choose,None)
            infos=__deal_infos(query("""{sql} where {choose}='{value}'""".format(sql=sql,choose=choose,value=value)),col)
        except Exception as e:
            infos={"status":False,"data":[],"message":"Could not find key={choose}!".format(choose=choose)}
    return json.dumps(infos)
