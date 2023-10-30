from sys import displayhook
#import pylab as plt 
import pandas as pd
#import seaborn as sns


def check_nan(df):
    
    """ Función de Yona
    Recibe un dataframe y enseña el % de nulos y lo grafica
    """
    
    nan_cols = df.isna().mean() * 100  # % de valores nulos
    
    nan_cols = nan_cols[nan_cols>0]
    
    displayhook(f'N nan cols: {len(nan_cols)}')
    displayhook(nan_cols)
    


def column_unification(df):

    #Remove spaces from rows
    for col in df.select_dtypes(include='object'):
        df[col] = df[col].str.strip()

    #Lowercase and spaces with _
    df.columns = [c.lower().replace(' ', '_') for c in df.columns]

    return df


def column_to_list(column):
    ls=[]
    for e in column:
        for s in str(e).split(','):
            ls.append(s)

    return ls


def split_string(string, character, wish_len, filler):

    lst= string.split(character)
    if(len(lst)<wish_len):
        for i in range(wish_len-len(lst)):
            lst.append(filler)
    elif(len(lst)>wish_len):
        for i in range(len(lst)-wish_len):
            lst.pop()
    
    return lst 

#So proud of this function :D
def fill_column(row, df_to_compare, column_to_compare, column_to_change):
    
    if row[column_to_compare] in df_to_compare[column_to_compare].values:
        
        matching_row = df_to_compare[df_to_compare[column_to_compare] == row[column_to_compare]]
        
        row[column_to_change] = matching_row[column_to_change].values[0]

    return row