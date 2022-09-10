. (Join-Path $PSScriptRoot 'pptxToPdf.designer.ps1')

function DisplayFiles {

    Param(
		[Parameter(Mandatory=$true,Position=0)]
		[System.Object]$modalTitle
	)

    $convertFileName.Text = ""

    $convertProgression.Visible = $false

    $percentage.Visible = $false

    $files = $modalTitle.FileNames

    $arr = @()

    foreach($file in $files) {

        $fileName = Split-Path $file -Leaf

        $arr += $fileName

        $fileList.Lines = $arr

    }

    if($files.Count -gt 1) {

        $convertTitle.Text = "Converted files: $($files.count)"

    }
    else {

        $convertTitle.Text = "Converted file: $($files.count)"

    }

}

function ConvertToPdf {

	Param(
		[Parameter(Mandatory=$true,Position=0)]
		[System.Object]$modalTitle
	)

    $selectedFiles = $modalTitle.ShowDialog()


    if($selectedFiles -eq "OK") {

        $files = $modalTitle.FileNames

        foreach ( $file in $files ) {

            # ProgressBar

            $convertProgression.Visible = $true

            $percentage.Visible = $true

            $i++

            [int]$progress = ($i / $files.count) * 100

            $convertProgression.Value = $progress

            $percentage.Text = "$progress%"

            $convertProgression.Update()

            $fileName = Split-Path $file -Leaf

            $convertFileName.Text = "Converting: $fileName"

            # End ProgressBar

            Get-ChildItem $file -File -Filter *pptx -Recurse |

                ForEach-Object -Begin {

                    $null = Add-Type -Path $PSScriptRoot\Microsoft.Office.Interop.PowerPoint.dll

                    $SaveOption = [Microsoft.Office.Interop.PowerPoint.PpSaveAsFileType]::ppSaveAsPDF

                    $PowerPoint = New-Object -ComObject "PowerPoint.Application"

                } -Process {

                    try {

                        $Presentation = $PowerPoint.Presentations.Open($_.FullName)

                        $PdfNewName  = $_.FullName -replace '\.pptx$','.pdf'

                        $Presentation.SaveAs($PdfNewName,$SaveOption)

                        $Presentation.Close()

                    }
                    catch {

                        Write-Error $_ -ErrorAction SilentlyContinue

                    }

                } -End {

                    $PowerPoint.Quit()

                    Stop-Process -Name POWERPNT -Force

                }

            }

            DisplayFiles $modalTitle

        }
        else {}

}

function ShowAbout {

    [void] [System.Windows.Forms.MessageBox]::Show(

        " pptxToPdf v1.0.0`n`n Author: Paniconi Fabio`n`n Email: reg@pfcode.net`n`n Repo: https://github.com/Dragod/bulk-pptx-to-pdf `n`nThis script is free software: you can redistribute it and/or modify`n it under the terms of the GNU General Public License as published by`n the Free Software Foundation, either version 3 of the License, or`n (at your option) any later version.`n`nThis program is distributed in the hope that it will be useful,`n but WITHOUT ANY WARRANTY; without even the implied warranty of`n MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the`n GNU General Public License for more details.`n`nYou should have received a copy of the GNU General Public License`n along with this program.  If not, see <http://www.gnu.org/licenses/>.",

        "About pptxToPdf",

        "OK",

        "Information"
    )

}