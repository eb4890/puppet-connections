define connection::cluster::member($param='')
{
 
 $src_title = "Src${title}"
 $dest_title = "Dest${title}"

 notice($src_title);
 notice($dest_title);
 Connection::Connection::Dest <| tag == $title |>
 Connection::Connection::Src <| tag == $title  |> 
}

