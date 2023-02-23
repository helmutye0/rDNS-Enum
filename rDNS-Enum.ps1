$cidr=10
$ip16=0

while ( $ip16 -le 255 ) {

	$ip24=0

	while ( $ip24 -le 255 ) {
	

        write-host "$cidr.$ip16.$ip24.0/24"
        $interface=0

			while ( $interface -le 255 ) {
			                
				$host=""
                $ip="$cidr`.$ip16`.$ip24`.$interface"
                $host=((nslookup $host | select-string Name) -split ":    ") -replace "Name","" | ? {$_.trim() -ne "" }
                
                if ( $host ) {
                
					"$ip | $host" >> dns-hosts.txt
					
                }
				
			$interface++
			
			}

        $ip24++
		
	}
	
$ip16++

}
