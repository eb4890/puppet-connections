define connection::cluster (
  $external_ports = [],
  $internal_ports = [],
  $external_ip_ranges = [],
  $internal_ip_ranges = [],
  $cluster_vip = undef, 
) 
{
 $src_title = "Src${title}"
 $dest_title = "Dest${title}"
  notice($src_title) 
  notice($dest_title) 
  @connection::connection::src{"self_$title":
    dest_ip_ranges   => $internal_ip_ranges,
    dest_ports 	   => $internal_ports, 
    src_ip_ranges => $internal_ip_ranges,
    src_cluster => $title,
    dest_cluster => $title,
    tag => $title,
  }
  @connection::connection::dest{"self_$title":
    dest_ip_ranges   => $internal_ip_ranges,
    dest_ports 	   => $internal_ports, 
    src_ip_ranges => $internal_ip_ranges,
    src_cluster => $title,
    dest_cluster => $title,
    tag => $title,
  }
  
}
