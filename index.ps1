$AI = "$PSScriptRoot\microsoft.applicationinsights.1.2.3\lib\net45\Microsoft.ApplicationInsights.dll"
[Reflection.Assembly]::LoadFile($AI)

$InstrumentationKey =  [System.Environment]::GetEnvironmentVariable("APPINSIGHTS_INSTRUMENTATIONKEY")
Write-Output "InstrumentationKey $($InstrumentationKey)" 
$TelClient = New-Object "Microsoft.ApplicationInsights.TelemetryClient"
$TelClient.InstrumentationKey = $InstrumentationKey

$TelClient.TrackEvent("Test from Powershell")
$TelClient.Flush()