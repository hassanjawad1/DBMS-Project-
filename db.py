import streamlit as st
import pandas as pd
from sqlalchemy import create_engine, text

# Function to connect to SQL Server and retrieve data based on user role and table
def get_data(user_role, table_name):
    #%pip install pyodbc
    conn_str = 'mssql+pyodbc://Mydeb:jamali 13@HASSAN-JAWAD\\SQLEXPRESS01/Jawad?driver=ODBC+Driver+17+for+SQL+Server'
    engine = create_engine(conn_str)

    # Customize the SQL query based on user role and table name
    query = text(f'SELECT * FROM Jawad.dbo.{table_name}')  # Pass the query as a text object

    # Fetch data using pandas
    data = engine.connect().execute(query).fetchall()
    data = pd.DataFrame(data, columns=engine.connect().execute(query).keys())
    return data

# Streamlit app
def main():
    st.title("Assignment Uploader Website by Hassan Jawad (21CS036) & Shaheer Ahmed (21CS034)")

    st.sidebar.title("User Role and Table Selection")

    # Sidebar for user selection
    user_role = st.sidebar.selectbox("Select User Role", ['Admin', 'Student', 'Teacher'])

    # Sidebar for table selection
    table_name = st.sidebar.selectbox("Select Table", ['student', 'submission', 'Courses', 'assignment'])

    # Get data based on user role and table name
    data = get_data(user_role, table_name)

    # Display the data
    st.subheader(f"Data for {user_role} user from {table_name} table:")
    st.dataframe(data)

# Run the app
if __name__ == "__main__":
    main()

