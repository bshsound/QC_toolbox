$Meer = "NORDSEE/" 
$Station = "ES1/" 
$Hydrophon = "H1/" 
$Ort = "X:$Ziel = "X:cd $Ort 
$items = Get-ChildItem *.wav 
foreach ($item in $items) 
{ 
Write-Host $item.Name 
if($item.Name.StartsWith("NoRealData")){ 
#Write-Host("No Real Data") 
$monat = $item.Name.Substring(,2)	 
#Write-Host($monat) 
$tag = $item.Name.Substring(,2) 
#Write-Host($tag) 
$jahr = $item.Name.Substring(,2) 
#Write-Host($jahr) 
$Datei = $Ort + $item.Name 
$Zielordner = $Ziel + $Meer + $Station + $Hydrophon + "20" + $jahr + "/" + $monat + "/" + $tag + "/" 
Write-Host($Zielordner) 
#if (!(Test-Path -path $Zielordner)) {New-Item $Zielordner -Type Directory} 
#Copy-item $Datei -Destination $Zielordner -Recurse -Force -Verbose 
}else { 
Write-Host("Real Data") 
$monat = $item.Name.Substring(,2)	 
$tag = $item.Name.Substring(
,2) 
$jahr = $item.Name.Substring(,2) 
$Datei = $Ort + $item.Name 
$Zielordner = $Ziel + $Meer + $Station + $Hydrophon + "20" + $jahr + "/" + $monat + "/" + $tag + "/" 
Write-Host($Zielordner) 
#if (!(Test-Path -path $Zielordner)) {New-Item $Zielordner -Type Directory} 
#Copy-item $Datei -Destination $Zielordner -Recurse -Force -Verbose 
}     
}  
