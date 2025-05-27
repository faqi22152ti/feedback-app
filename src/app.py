from flask import Flask, request

app = Flask(__name__)

@app.route('/')
def form():
    return '''
        <form method="POST" action="/submit">
            <input name="feedback" />
            <button type="submit">Submit</button>
        </form>
    '''

@app.route('/submit', methods=['POST'])
def submit():
    feedback = request.form['feedback']
    return f"Feedback received: {feedback}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)

