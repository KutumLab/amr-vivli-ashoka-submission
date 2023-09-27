import pandas as pd
import numpy as np

df=pd.read_csv('data/KP-ASH-1821.csv')
df['subtype']=df[df.columns[9:]].apply(
    lambda x:''.join(x.dropna().astype(str)),
    axis=1
)

df2 = df.groupby(['Year','Country','subtype'])['subtype'].count()

df2.to_csv('ATS-subtype5-con.csv')

