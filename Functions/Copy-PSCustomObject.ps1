function Copy-PSCustomObject 
{
<#
.SYNOPSIS

Returns a complete standalone clone of the source Object
.DESCRIPTION

PowerShell will still update the source PSCustomObject when you clone useing the built in .copy function
This function creates a fully standalone clone of the InputObject so you can use them seperatley 
.PARAMETER InputObject

The PSCustomObject you wish to be cloned
.EXAMPLE
$Clone = Copy-PSCustomObject -InputObject $MyPSCustomObject
#>
    Param(
    [Parameter(Mandatory=$true)]
    [PSCustomObject]
    $InputObject
    )
    
    $ms = New-Object System.IO.MemoryStream
    $bf = New-Object System.Runtime.Serialization.Formatters.Binary.BinaryFormatter
    $bf.Serialize($ms, $InputObject)
    $ms.Position = 0
    $OutputObject = $bf.Deserialize($ms)
    $ms.Close()
    
    return $OutputObject
}
