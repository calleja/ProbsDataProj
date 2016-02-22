# -*- coding: utf-8 -*-
"""
Created on Sun Feb 21 19:50:38 2016

@author: lechuza
"""

import Quandl
dir(Quandl)
spaaa = Quandl.get("SPDJ/SPUSG2AT", trim_start="2012-01-02", trim_end="2016-02-20")

baamoody = Quandl.get("MOODY/DBAAYLD", trim_start="2012-01-02", trim_end="2016-02-20")

aaamoody = Quandl.get("MOODY/DAAAYLD", trim_start="2012-01-02", trim_end="2016-02-20")

spy = Quandl.get("CHRIS/CME_SP1", trim_start="2012-01-02", trim_end="2016-02-20")

jy1 = Quandl.get("CHRIS/CME_JY1", trim_start="2012-01-02", trim_end="2016-02-20")

cccml = Quandl.get("ML/HYOAS", trim_start="2012-01-02", trim_end="2016-02-20")