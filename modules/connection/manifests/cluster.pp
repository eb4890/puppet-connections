define connection::cluster (
  external_ports = [],
  internal_ports = [],
  external_ip_ranges = [],
  internal_ip_ranges = [],
  cluster_vip = undef, 
) 
{
  Connection::Connection::Dest <| tag == "Dest${title}" |>
#  { Not used for the moment as hiera looks everything up
#
#     dest_ports => $external_ports,
#     dest_ip_ranges => $external_ip_ranges,
#  }
  Connection::Connection::Src <| tag == "Src${title}" |> 
#  { Not used for the moment as hiera looks everything up
#     src_ip_ranges => $external_ip_ranges
#  }
  connection::connection::src{"self_$title":
    dest_ip_ranges   => $internal_ip_ranges,
    dest_ports 	   => $internal_ports, 
    src_ip_ranges => $internal_ip_ranges,
  }
  connection::connection::dest{"self_$title":
    dest_ip_ranges   => $internal_ip_ranges,
    dest_ports 	   => $internal_ports, 
    src_ip_ranges => $internal_ip_ranges,
  }
}
