Add-Type -AssemblyName System.Windows.Forms

$WatermarkFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$WatermarkFileDialog.initialDirectory = "C:/"
$WatermarkFileDialog.filter = "Watermark PDF (*.pdf)| *.pdf"
$WatermarkFileDialog.ShowDialog() | Out-Null
$WatermarkPDF = $WatermarkFileDialog.filename

$InputFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$InputFileDialog.initialDirectory = "C:/"
$InputFileDialog.filter = "Input PDF (*.pdf)| *.pdf"
$InputFileDialog.ShowDialog() | Out-Null
$InputPDF = $InputFileDialog.filename

$OutputFolderDialog = New-Object System.Windows.Forms.FolderBrowserDialog -Property @{
    SelectedPath = "C:/"
    Description = "Choose an output folder"
}
 
[void]$OutputFolderDialog.ShowDialog()
$OutputFolder = $OutputFolderDialog.SelectedPath

$OutputFile = $OutputFolder + "\newfile.pdf"

# Write-Host "Watermark is " $WatermarkPDF
# Write-Host "Input is " $InputPDF
# Write-Host "Output is " $OutputFile

$command = "python watermark.py " + $WatermarkPDF + $InputPDF + $OutputFile
Invoke-Expression $command