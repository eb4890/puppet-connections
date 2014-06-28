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
  	$src_ip_ranges_ = $clusters[$src_cluster]['external_ip_ranges']
  } else {
    $src_ip_ranges_ =$src_ip_ranges
  }
  
  if ($dest_ip_ranges == []) {
  	$dest_ip_ranges_ = $clusters[$dest_cluster]['external_ip_ranges']
  } else {
    $dest_ip_ranges_ =$dest_ip_ranges
  }
  

  if ($dest_ports == []) {
  	$dest_ports_ = $clusters[$dest_cluster]['external_ports']
  } else {
    $dest_ports_ =$dest_ports
  }
  #$string_ports = map($dest_ports_) |port| {}
  @connection::connection::src{ "${src_cluster}_${dest_cluster}": 
    src_cluster => $src_cluster,
    dest_cluster => $dest_cluster,
    protos => $protos,
    dest_ip_ranges => $dest_ip_ranges_,
    src_ip_ranges => $src_ip_ranges_,
    dest_ports => $dest_ports_,
    tag => $src_cluster,
  }   
  @connection::connection::dest{ "${src_cluster}_${dest_cluster}": 
    src_cluster => $src_cluster,
    dest_cluster => $dest_cluster,
    protos => $protos,
    dest_ip_ranges => $dest_ip_ranges_,
    src_ip_ranges => $src_ip_ranges_,
    dest_ports => $dest_ports_,
    tag => $dest_cluster,
   # require => Connection::Port[$dest_ports_] Fix this 
  }
  
     
}
