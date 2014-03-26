# Create cassandra cluster and keyspace
ccm create ReactiveGridCluster -v 2.0.6
ccm populate -n 3
ccm start
ccm node1 cqlsh -f /vagrant/schema.sh
