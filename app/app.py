from flask import Flask, render_template, request, redirect, url_for
import os

app = Flask(__name__)
todos = []
POD_NAME = os.getenv("POD_NAME", "unknown-pod")

@app.route("/")
def index():
    return render_template("index.html", todos=todos, pod_name=POD_NAME)

@app.route("/add", methods=["POST"])
def add():
    todo = request.form.get("todo")
    if todo:
        todos.append(todo)
    return redirect(url_for("index"))

@app.route("/delete/<int:index>")
def delete(index):
    if 0 <= index < len(todos):
        todos.pop(index)
    return redirect(url_for("index"))

# This is crucial for Flask CLI
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)