from pymongo import MongoClient
from pymongo.server_api import ServerApi

try:
    client = MongoClient(
        "mongodb+srv://vlad:1987@clusterpython.mwbls2w.mongodb.net/?retryWrites=true&w=majority&appName=ClusterPython",
        server_api=ServerApi("1"),
    )
    db = client.cats.cats
    print(f"[INFO] Database connected sucsses")
except Exception as e:
    print(f"[INFO] Not connect")


def read():
    results = db.find({})
    for el in results:
        print(f"{el}")


def read_by_name():
    cat_name = input("Enter cat name: ")
    result = db.find_one({"name": cat_name})
    print(f"{result}")


def update_age_by_name():
    cat_name = input("Enter cat name: ")
    cat_age = int(input("Enter cat age: "))
    print(f"{type(cat_age)}")
    db.update_one({"name": cat_name}, {"$set": {"age": cat_age}})
    resp = db.find_one({"name": f"{cat_name}"})
    print(f"{resp}")


def add_feature():
    cat_name = input("Enter cat name: ")
    feature = input("Enter feature:  ")
    db.update_one(
        {"name": cat_name},
        {"$push": {"features": feature}},
    )
    resp = db.find_one({"name": f"{cat_name}"})
    print(f"{resp}")


def delete_by_name():
    cat_name = input("Enter cat name: ")
    db.delete_one({"name": cat_name})
    resp = db.find_one({"name": cat_name})
    print(f"{resp}")


def delete_all():
    db.delete_many({})
    resp = db.find({})
    print(f"{resp}")
