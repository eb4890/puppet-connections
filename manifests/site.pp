
$connections = hiera_hash('connections')
$clusters = hiera_hash('clusters')
create_resources('connection::connection', $connections)
create_resources('connection::cluster', $cluster)

