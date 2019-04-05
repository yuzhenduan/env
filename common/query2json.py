# -*- coding: utf-8 -*-
#######################
#  env.query2json
#######################

import collections

def infos2json(infos,col):
    objects_list=[]
    for row in infos:
        column=collections.OrderedDict()
        column=dict(zip(col,row))
        objects_list.append(column)
    return objects_list

