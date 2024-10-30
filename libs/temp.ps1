$Meer = "Ostsee/" 
$Station = "ARK/" 
$Hydrophon = "H1/" 
$Ort = "G:/OSTSEE/ARK_geborgen_240925/6688/" 
$Ziel = "Y:/Meereskunde/UWS/Dauer/" 
cd $Ort 
$items = Get-ChildItem ('*.wav','*.wavx') 
foreach ($item in $items) 
{ 
Write-Host $item.Name 
$monat = $item.Name.Substring(6,2)	 
$tag = $item.Name.Substring(8,2) 
$jahr = $item.Name.Substring(4,2) 
$Datei = $Ort + $item.Name 
$Zielordner = $Ziel + $Meer + $Station + $Hydrophon + "20" + $jahr + "/" + $monat + "/" + $tag + "/" 
Write-Host($Zielordner) 
if (!(Test-Path -path $Zielordner)) {New-Item $Zielordner -Type Directory} 
$zielDatei = Join-Path -Path $Zielordner -ChildPath $item.Name 
$counter = 1 
while (Test-Path -Path $zielDatei) { 
$filenameWithoutExt = [System.IO.Path]::GetFileNameWithoutExtension($item.Name) 
$extension = [System.IO.Path]::GetExtension($item.Name) 
$zielDatei = Join-Path -Path $Zielordner -ChildPath ("{0}({1}){2}" -f $filenameWithoutExt, $counter, $extension) 
$counter++ 
} 
Write-Host($zielDatei) 
Copy-Item -Path $Datei -Destination $zielDatei -Force -Verbose 
}  
