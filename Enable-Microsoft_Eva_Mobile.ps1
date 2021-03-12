$sourcePath = 'HKLM:\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens'       #Where the OneCore voices live
$destPath1 =  'HKLM:\SOFTWARE\Microsoft\Speech\Voices\Tokens'                #For 64-bit apps
$destPath2 =  'HKLM:\SOFTWARE\WOW6432Node\Microsoft\SPEECH\Voices\Tokens'    #For 32-bit apps
Set-Location $destPath1

$listVoices = Get-ChildItem $sourcePath
foreach( $voice in $listVoices )
{
    $source = $voice.PSPath #Get the path of this voices key
    Copy-Item -Path $source -Destination $destPath1 -Recurse
    Copy-Item -Path $source -Destination $destPath2 -Recurse
}

