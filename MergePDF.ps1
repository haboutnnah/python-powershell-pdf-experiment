Add-Type -AssemblyName System.Windows.Forms

$MergeFolderDialog = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    SelectedPath = 'C:\'
    Description = "Choose the folder that contains your PDFs"
}
 
[void]$MergeFolderDialog.ShowDialog()
$MergeFolder = $MergeFolderDialog.SelectedPath

$OutputFolderDialog = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    SelectedPath = $MergeFolder
    Description = "Choose an output folder"
}
 
[void]$OutputFolderDialog.ShowDialog()
$OutputFolder = $OutputFolderDialog.SelectedPath

$OutputFile = $OutputFolder + "\output.pdf"

Set-Location $MergeFolder

$command = "python merge.py " + $OutputFile

# Write-Host "Folder to merge is " $MergeFolder
# Write-Host "Output is " $OutputFile

Invoke-Expression $command