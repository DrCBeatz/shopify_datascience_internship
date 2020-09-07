# ******************************************************************

import pandas as pd

# import dataset as dataframe

df = pd.read_excel('2019 Winter Data Science Intern Challenge Data Set.xlsx')

# ******************************************************************
# Q1a: "Think about what could be going wrong with our calculation.
#      Think about a better way to evaluate this data."
# ******************************************************************

# If we check the results of our dataframe we see there are some very large
# order amounts and quantities per orders which might be skewing the results
# of our Average Order Amount calculation:

print(df.loc[:].sort_values( by='order_amount', ascending=False))

# in particular there are two shops (shop_id 42 and 78) which have all these large orders:

print(df[(df['shop_id'] == 42) | (df['shop_id'] == 78) ])

# we can create copy of original dataframe with large order amounts (more than $2000)
# and total items (more than 100 items) filtered out:

df2 = df[(df['total_items'] < 100) & (df['order_amount'] < 2000)]

# ******************************************************************
# Q2b: "What metric would you report for this dataset?"
# ******************************************************************

# We can calculate the average order value for this new dataframe:

print('Average order amount: ', df2['order_amount'].mean())

# ******************************************************************
# Q2c: "What is its value?
# ******************************************************************

# *******************************************************************
# Answer (for): Average order amount:  $302.58
# *******************************************************************

# this seems much more reasonable than our AOV of $3145.13 of the original dataset
