import pandas as pd

raw_data = pd.read_csv('ugly_sweaters.csv', index_col='sweater')
sweaters = raw_data[raw_data['hs_tf'] == 'Yes']

sweaters['colors_list'] = sweaters['colors'].str.split(',')
color_data = sweaters.explode('colors_list')
sweaters['num_colors'] = color_data.groupby('sweater')['colors_list'].count()