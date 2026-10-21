from flask import Flask, request, send_from_directory
import socket
app = Flask(__name__)

@app.route('/')
def index():
    return send_from_directory('static', 'frontend.html')
@app.route('/send-packet', methods=['POST'])
def send_packet():
    data = request.get_json()
    client_ip = request.remote_addr
    protocol = socket.SOCK_STREAM if data['protocol'] == 'tcp' else socket.SOCK_DGRAM
    with socket.socket(socket.AF_INET, protocol) as s:
        s.connect((data['ip'], int(data['port'])))
        callback_string = client_ip + " requested a callback\n"
        s.sendall(callback_string.encode('utf-8'))
        s.close()
    return (f"{client_ip} requested a callback to {data['ip']}:{data['port']} over {data['protocol']}")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
