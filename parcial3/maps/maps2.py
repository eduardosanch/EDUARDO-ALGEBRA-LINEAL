import pandas as pd
import numpy as np
import streamlit as st

st.title('hello maps')
map_data = pd.DataFrame(
  np.random.randn (150, 2) / [100, 100] + [40.41831,-3.70275],
  columns=['lat', 'lon']
)


st.map(map_data)
st.dataframe(map_data)

