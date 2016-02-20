# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

import pandas as pd
from fredapi import Fred
import matplotlib.pyplot as plt
from matplotlib.dates import date2num , DateFormatter
import datetime as dt
fred = Fred(api_key='70da3ebf45f3904117b34c5147b93443')

from IPython.core.pylabtools import figsize
figsize(20, 5)

oer=fred.get_series('CUSR0000SEHC01',observation_start='2002-01-01') #owner equivalent rent
real_rent=fred.get_series('CUSR0000SEHA',observation_start='2002-01-01')

#not so simple to plot datetime in matplot lib... typically requires a conversion to strings


fig, ax= plt.subplots()
ax.plot_date(oer.index,oer,fmt='-',color='green',label='owner equivalent rent') #this works well... now I want to add other series to this
ax.plot_date(oer.index,real_rent,fmt='-',color='red',label='rent of primary residence')
plt.title('owner equivalent rent')
legend = ax.legend(loc='lower right', shadow=True)
#frame = legend.get_frame()
plt.show()

'''playing around
ax.plot_date(TA, A, 'b--')
ax.plot_date(TB, B, 'g:')
- done playing around
'''

type(real_rent.index)

retailSales= fred.get_series('RETAILMPCSMSA',observation_start='2002-01-01')
totRetailSales=fred.get_series('RSXFS',observation_start='2002-01-01') #reported 1/1/16 already... this is not an index
totRetailSales.index[-10:]
retailSales[-10:]
totRetailSales[0:168]


fig, ax= plt.subplots()
ax.plot_date(oer.index,oer,fmt='-',color='green',label='owner equivalent rent') #this works well... now I want to add other series to this
ax.plot_date(oer.index,real_rent,fmt='-',color='red',label='rent of primary residence')
ax.plot_date(oer.index,retailSales,fmt='-',color='purple',label='retail sales')
ax.plot_date(oer.index,totRetailSales[0:168],fmt='-',color='orange',label='tot retail sales') #doesn't work because this series has one more observation than the others
plt.title('rent vs. retail')
legend = ax.legend(loc='middle right', shadow=True)
#frame = legend.get_frame()
plt.show()


'''
the y-variables

'''