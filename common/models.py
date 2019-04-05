# -*- coding: utf-8 -*-
#######################
# common.models
#######################

from django.db import connection

def query(str):
    data={'status':False,'data':None,'message':'open cursor error!'}
    with connection.cursor() as cursor:
       try:
          cursor=connection.cursor()
          cursor.execute(str)
          infos=cursor.fetchall()
          data={'status':True,'data':infos,'message':'succeed'}
       except Exception as e:
          data={'status':False,'data':[],'message':'Maybe there is a problem with SQL!'}    
    return data
