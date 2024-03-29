import streamlit as st
import pandas as pd     
from sqlalchemy import create_engine, text

# Function to connect to SQL Server 
def get_data(user_role, table_name):
    #%pip install pyodbc
    conn_str = 'mssql+pyodbc://@HASSAN-JAWAD\\SQLEXPRESS01/Jawad?trusted_connection=yes&driver=ODBC+Driver+17+for+SQL+Server'
    engine = create_engine(conn_str)

    # Customize the SQL query based on user role and table name
    query = text(f'SELECT * FROM Jawad.dbo.{table_name}')  

    # Fetch data using pandas
    data = engine.connect().execute(query).fetchall()
    data = pd.DataFrame(data, columns=engine.connect().execute(query).keys())
    return data

# Streamlit app
def main():

    st.title("Assignment Uploader Website")
    st.write("- Hassan Jawad (21CS036)")
    st.write("- Shaheer Ahmed (21CS034)")
    st.write("- Sajjad Ali (21CS068)")
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

