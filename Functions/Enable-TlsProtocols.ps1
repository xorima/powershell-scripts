function Enable-TlsProtocols
{
 <#
.Synopsis
   This function will enable a given list of protocols
.DESCRIPTION
   This function will enable a given list of security protocols, if 
   none are supplied it will enable all security protocols the system knows about
   it will return the list of enabled protocols
.protocols
   A list of protocols to enable
#>   
    
    param(
    [String[]]
    $protocols = ($protocols = [enum]::GetNames([Net.SecurityProtocolType]))
    )
    
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::SystemDefault  
    
    foreach ($protocol in $protocols | Where-Object {$_.name -ne 'SystemDefault'}){
        [Net.ServicePointManager]::SecurityProtocol +=  [Net.SecurityProtocolType]::$protocol
    }
    return $protocols
}
