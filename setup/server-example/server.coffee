# RG Core: Messaging server
# Binds zeromq REP socket to tcp://*:5555
# Expects a triplet from client, replies with null.

zmq = require("zmq")
cql = require("node-cassandra-cql")

# socket to talk to clients
responder = zmq.socket("rep")

# arguments
args = process.argv.slice(2);
keyspace = args[0]
hosts = args.slice(1)

# static configuration
consistency = cql.types.consistencies.quorum
statement = "INSERT INTO metric (metric_name, event_time, value) values (?, ?, ?)"

client = new cql.Client
  hosts: hosts
  keyspace: keyspace

responder.on "message", (request) ->
  responder.send null
  params = request.toString().split(",")
  client.execute statement, params, consistency, (err) ->
    console.log err if err

responder.bind "tcp://*:5555", (err) ->
  if err
    console.log err
  else
    console.log "Listening on 5555..."

process.on "SIGINT", ->
  responder.close()
