# Set path to hats
$path_to_hats = "$env:PROGRAMFILES\hats"
echo "path_to_hats: $path_to_hats"

If(!(test-path $path_to_hats))
{
	New-Item -ItemType Directory -Force -Path "$path_to_hats"
}

echo "Removing temporary files that are no longer needed"
$fso = New-Object -ComObject scripting.filesystemobject
$fso.DeleteFolder("$path_to_hats\7-Zip")
$fso.DeleteFolder("androidSDK")
$fso.DeleteFile("$path_to_hats\chromedriver.zip")
$fso.DeleteFile("$path_to_hats\geckodriver.zip")
$fso.DeleteFile("$path_to_hats\IEDriverServer.zip")
$fso.DeleteFile("$path_to_hats\VCForPython27.msi")
$fso.DeleteFile("$path_to_hats\python27.msi")
$fso.DeleteFile("$path_to_hats\7z.msi")
$fso.DeleteFile("$path_to_hats\jdk.exe")
$fso.DeleteFile("$path_to_hats\jre.exe")
$fso.DeleteFolder("$path_to_hats\jdk-first-extraction")
$fso.DeleteFolder("$path_to_hats\jdk-second-extraction")
$fso.DeleteFile("$path_to_hats\androidSDK.zip")
$fso.DeleteFile("$path_to_hats\get-pip.py")
$fso.DeleteFile("$path_to_hats\node.zip")
$fso.DeleteFile("$path_to_hats\haxm.zip")
$fso.DeleteFile("$path_to_hats\PortableGit.exe");

echo "Copy shell scripts to $path_to_hats"
Copy-Item "shell\*" "$path_to_hats" -recurse

echo "Copy testpage to $path_to_hats"
Copy-Item "testpage" "$path_to_hats" -recurse

echo "Set Last Check for Update today"
Get-Date > "$path_to_hats\utils\last-check.txt"