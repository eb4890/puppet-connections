# Here goes 
# - A check to see if the dest is contactable
# - Something to expose that check via http so that the dest can check whether it is available to dependent services

define connection::connection::src(
  $src_cluster,
  $dest_cluster,
  $src_ip_ranges = [],
  $dest_ip_ranges = [],
  $dest_ports = [],
  $protos = [],
)
{
}
