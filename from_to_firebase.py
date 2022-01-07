import firebase_admin
import time
from firebase_admin import credentials
from firebase_admin import firestore
from firebase_admin import threading
import serial
import json;

# firestore setup
cred = credentials.Certificate("growhouse-dashboard.json")
firebase_admin.initialize_app(cred)
db = firestore.client()
callback_done = threading.Event()
dataRef = db.collection(u'data').document(u'allData')

# interact with PUTTY
s = serial.Serial('COM3')
print("Connected to: " + s.portstr)

def read():
    s.write(bytes("read" + "\r\n", 'UTF-8'))
    time.sleep(1)
    res = s.readline()
    res = str(res)
    if "{" in res and "}" in res and "write" not in res:
        print(res)
        res = res[res.find("{") : res.find("}") + 1]
        decoded = json.loads(res)
        dataRef.update({
            'pH': float(decoded['ph']),
            'temperature': float(decoded['temperature']),
            'humidity': float(decoded['humidity']),
            "redIntensity": float(decoded['red_intensity']),
            "greenIntensity": float(decoded['green_intensity']),
            "blueIntensity": float(decoded['blue_intensity']),
            "redConcentration": float(decoded['red_concentration']),
            "greenConcentration": float(decoded['green_concentration']),
            "blueConcentration": float(decoded['blue_concentration']),
        })
        

def write(doc):
    print("write {\"red\":" + str(doc.get('red')) + ",  \"blue\":" + str(doc.get('blue')) + ", \"green\":" + str(doc.get('green')) + "}")
    s.write(bytes("write {\"red\":" + str(doc.get('red')) + ",  \"blue\":" + str(doc.get('blue')) + ", \"green\":" + str(doc.get('green')) + "}" + "\r\n", 'UTF-8'))


def on_snapshot(doc_snapshots, changes, read_time):
    for doc in doc_snapshots:
        write(doc)
        # read()
    callback_done.set()

dataRef.on_snapshot(on_snapshot)
print("Program Running")
while True:
    # print("Reading New Data")
    # read()
    continue




