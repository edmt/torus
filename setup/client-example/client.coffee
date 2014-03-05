zmq       = require("zmq")
requester = zmq.socket("req")
REPLIES   = 1

send_request = (req) ->
  console.log "Sending request #{i}..."
  requester.send "Hello"

receive_reply = (reply) ->
  console.log "Received reply #{REPLIES}: #{reply.toString()}"
  REPLIES += 1
  if REPLIES > 5
    requester.close()
    process.exit 0

console.log "Connecting to server..."
requester.on "message", receive_reply
requester.connect "tcp://127.0.0.1:5555"
send_request i for i in [1..5]
