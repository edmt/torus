CREATE KEYSPACE reactivegrid_ks
WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 3 };

use reactivegrid_ks;

CREATE TABLE IF NOT EXISTS metric (
  metric_name text,
  event_time timestamp,
  value text,
  PRIMARY KEY (metric_name, event_time)
);
