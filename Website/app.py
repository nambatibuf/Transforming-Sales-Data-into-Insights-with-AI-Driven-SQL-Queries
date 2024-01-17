
from flask import Flask, render_template, request
import psycopg2
from langchain.chains import create_sql_query_chain
from langchain.chat_models import ChatOpenAI
from langchain.llms import OpenAI
from langchain.utilities import SQLDatabase
from langchain.chains import create_sql_query_chain
from langchain.chat_models import ChatOpenAI

app = Flask(__name__)

# PostgreSQL connection parameters
db_params = {
    'dbname': 'postgres',
    'user': 'postgres',
    'password': 'superuser',
    'host': 'localhost',
    'port': '5432',
    'options': '-c search_path=sales_data'
}

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/search', methods=['POST'])
def search():
    connection = None
    try:
        connection = psycopg2.connect(**db_params)
        cursor = connection.cursor()
        db = SQLDatabase.from_uri("postgresql+psycopg2://%(user)s:%(password)s@%(host)s:%(port)s/%(dbname)s" % db_params)
        chain = create_sql_query_chain(ChatOpenAI(temperature=0, api_key="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"), db)
        query = request.form["query"]
        response = chain.invoke({"question": query})
        cursor.execute(response)
        columns = [desc[0] for desc in cursor.description]
        query_result = cursor.fetchall()

        return render_template('result.html', columns=columns, query_result=query_result)

    except Exception as e:
        return str(e)

    finally:
        if connection:
            connection.close()

if __name__ == '__main__':
    app.run(debug=True)


if __name__ == '__main__':
    app.run(debug=True)
