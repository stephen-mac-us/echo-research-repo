# bad_code.py
import os
import subprocess
import flask

app = flask.Flask(__name__)

@app.route('/run/<cmd>')
def run(cmd):
    return subprocess.getoutput(cmd)  # Command injection vulnerability

@app.route('/secrets')
def secrets():
    secret_key = "hardcoded_secret_key_123"  # Hardcoded secret
    return f"The secret is: {secret_key}"

if __name__ == "__main__":
    app.run()
