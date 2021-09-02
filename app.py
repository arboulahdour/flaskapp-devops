from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
  return '<body style="background: #0b131f; color: white; font-size: 30px; margin: 100px; letter-spacing: 2.5px;"><h1><center>--- Flask Application For DevOps Lab ---</center></h1></body>'

app.run(host='0.0.0.0', port=5000)
