. (Join-Path $PSScriptRoot 'pptxToPdf.designer.ps1')

. (Join-Path $PSScriptRoot 'convertToPdf.ps1')

[System.Windows.Forms.Application]::EnableVisualStyles()

$about.Add_Click({ShowAbout})

$exit.Add_Click({$pptxToPdf.Close()})

$github.Add_Click({ Start-Process 'https://github.com/Dragod/bulk-pptx-to-pdf' }.GetNewClosure())

$selectFileBtn.Add_Click({ConvertToPdf $OpenPptxModal})

$pptxToPdf.ShowDialog()

$pptxToPdf.Dispose()
