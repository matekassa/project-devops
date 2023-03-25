# Import the Flask class from the flask module
from flask import Flask

# Create a new Flask instance
app = Flask(__name__)


# Define a route that maps to the function hello()
@app.route("/")
@app.route("/app")
def hello():
    # Return the string "Hello, World!"
    return "Hello, World!"


# If the script is being run as the main module
if __name__ == "__main__":
    # Start the Flask app, listening on all available network interfaces
    app.run(debug=True, host='0.0.0.0', port='5000')
