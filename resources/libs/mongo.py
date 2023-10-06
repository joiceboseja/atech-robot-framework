from pymongo import MongoClient


client = MongoClient('mongodb+srv://joy:mudar123@cluster0.qdb8evk.mongodb.net/?retryWrites=true&w=majority')

db = client['markdb']

def remove_user_by_email(user_email):
    users = db['users']
    users.delete_many({'email': user_email})
    