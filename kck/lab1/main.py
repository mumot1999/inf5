import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
import matplotlib as mpl
mpl.rcParams['figure.figsize'] = (13,6)

# Series
ts = pd.Series(np.random.randn(1000), index=pd.date_range('1/1/2016', periods=1000))
#suma skumulowana
ts = ts.cumsum()
ts.plot()