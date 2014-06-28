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
   map($src_ip_ranges) |$src_ip_range| {
     map($dest_ip_ranges) |$dest_ip_range| {
       map($dest_ports) |$port|
       {
#         ufw::allow{"${src_cluster}-to-${dest_cluster}-${src_ip_range}-${dest_ip_range}-${port}":
#           from => $src_ip_range,
#           ip   => $dest_ip_range,
#           port => $port,
#         }
          file{"/tmp/${src_cluster}-to-${dest_cluster}-${src_ip_range}-${dest_ip_range}-${port}": 
            content => "Hi",	    
          }
         # Other things that could be here
       }
     }
   } 

}
