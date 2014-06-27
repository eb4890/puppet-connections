define connection::connection(
  $src_cluster,
  $dest_cluster,
  $protos = [],
  $src_ip_ranges = [],
  $dest_ip_ranges = [],
  $dest_ports = [],
  $protos = [],
)
{ 
  $clusters = hiera_hash('cluster')

  if ($src_ip_ranges == []) {
  	$src_ip_ranges = $clusters[$src_cluster]['external_ip_ranges']
  }
  if ($dest_ip_ranges == []) {
  	$dest_ip_ranges = $clusters[$dest_cluster]['external_ip_ranges']
  }
  if ($dest_ports == []) {
  	$dest_ports = $clusters[$dest_cluster]['external_ports']
  }
  
  @connection::connection::src{ "${title}${src_cluster}${dest_cluster}": 
    src_cluster => $src_cluster,
    dest_cluster => $dest_cluster,
    protos => $protos,
    dest_ip_ranges => $dest_ip_ranges,
    src_ip_ranges => $src_ip_ranges,
    dest_ports => $dest_ports,
    tag => "Src${src_cluster}",
  }   
  @connection::connection::dest{ "${title}${src_cluster}${dest_cluster}": 
    src_cluster => $src_cluster,
    dest_cluster => $dest_cluster,
    protos => $protos,
    dest_ip_ranges => $dest_ip_ranges,
    src_ip_ranges => $src_ip_ranges,
    dest_ports => $dest_ports,
    tag => "Dest${dest_cluster}",
    require => Connection::Port[$dest_ports]
  }
  
     
}
