zmq       = require("zmq")
async     = require("async")
requester = zmq.socket("req")
REPLIES   = 1
REQUESTS  = 1000

send_request = (req) ->
  requester.send "some-metric,#{Math.floor(Date.now() + Math.random() * 1000479865)},#{Math.random()}"

receive_reply = (reply) ->
  REPLIES += 1
  if REPLIES > REQUESTS
    requester.close()
    process.exit 0

console.log "Connecting to server..."
requester.on "message", receive_reply
requester.connect "tcp://127.0.0.1:5555"
async.each [1..REQUESTS], send_request, (err) ->
  console.log err
