
$connections = hiera_hash('connection')
$clusters = hiera_hash('cluster')
$cluster_memberships = hiera_hash('cluster_member')
create_resources('connection::connection', $connections)
create_resources('connection::cluster', $clusters)
create_resources('connection::cluster::member', $cluster_memberships)
