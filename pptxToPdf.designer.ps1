[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$pptxToPdf = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$selectFileBtn = $null
[System.Windows.Forms.OpenFileDialog]$OpenPptxModal = $null
[System.Windows.Forms.SplitContainer]$mainContainer = $null
[System.Windows.Forms.ProgressBar]$convertProgression = $null
[System.Windows.Forms.Label]$convertTitle = $null
[System.Windows.Forms.Label]$convertFileName = $null
[System.Windows.Forms.Label]$percentage = $null
[System.Windows.Forms.Label]$appHeader = $null
[System.Windows.Forms.PictureBox]$github = $null
[System.Windows.Forms.ToolStripMenuItem]$about = $null
[System.Windows.Forms.ToolStripMenuItem]$exit = $null
[System.Windows.Forms.MenuStrip]$appMenu = $null
[System.Windows.Forms.TextBox]$fileList = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'pptxToPdf.resources.ps1')
$mainContainer = (New-Object -TypeName System.Windows.Forms.SplitContainer)
$percentage = (New-Object -TypeName System.Windows.Forms.Label)
$convertProgression = (New-Object -TypeName System.Windows.Forms.ProgressBar)
$selectFileBtn = (New-Object -TypeName System.Windows.Forms.Button)
$appHeader = (New-Object -TypeName System.Windows.Forms.Label)
$github = (New-Object -TypeName System.Windows.Forms.PictureBox)
$convertFileName = (New-Object -TypeName System.Windows.Forms.Label)
$fileList = (New-Object -TypeName System.Windows.Forms.TextBox)
$convertTitle = (New-Object -TypeName System.Windows.Forms.Label)
$OpenPptxModal = (New-Object -TypeName System.Windows.Forms.OpenFileDialog)
$appMenu = (New-Object -TypeName System.Windows.Forms.MenuStrip)
$about = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
$exit = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)
([System.ComponentModel.ISupportInitialize]$mainContainer).BeginInit()
$mainContainer.Panel1.SuspendLayout()
$mainContainer.Panel2.SuspendLayout()
$mainContainer.SuspendLayout()
([System.ComponentModel.ISupportInitialize]$github).BeginInit()
$appMenu.SuspendLayout()
$pptxToPdf.SuspendLayout()
#
#mainContainer
#
$mainContainer.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]20,[System.Int32]40))
$mainContainer.Name = [System.String]'mainContainer'
#
#mainContainer.Panel1
#
$mainContainer.Panel1.Controls.Add($percentage)
$mainContainer.Panel1.Controls.Add($convertProgression)
$mainContainer.Panel1.Controls.Add($selectFileBtn)
$mainContainer.Panel1.Controls.Add($appHeader)
$mainContainer.Panel1.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10))
$mainContainer.Panel1.add_Paint($splitContainer1_Panel1_Paint)
#
#mainContainer.Panel2
#
$mainContainer.Panel2.Controls.Add($github)
$mainContainer.Panel2.Controls.Add($convertFileName)
$mainContainer.Panel2.Controls.Add($fileList)
$mainContainer.Panel2.Controls.Add($convertTitle)
$mainContainer.Panel2.add_Paint($left_col_Panel2_Paint)
$mainContainer.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]941,[System.Int32]450))
$mainContainer.SplitterDistance = [System.Int32]207
$mainContainer.TabIndex = [System.Int32]0
#
#percentage
#
$percentage.AutoSize = $true
$percentage.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]13,[System.Int32]395))
$percentage.Name = [System.String]'percentage'
$percentage.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$percentage.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]0,[System.Int32]24))
$percentage.TabIndex = [System.Int32]3
$percentage.Visible = $false
#
#convertProgression
#
$convertProgression.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]13,[System.Int32]422))
$convertProgression.Name = [System.String]'convertProgression'
$convertProgression.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]175,[System.Int32]5))
$convertProgression.Step = [System.Int32]1
$convertProgression.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$convertProgression.TabIndex = [System.Int32]2
$convertProgression.Visible = $false
#
#selectFileBtn
#
$selectFileBtn.Cursor = [System.Windows.Forms.Cursors]::Hand
$selectFileBtn.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$selectFileBtn.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$selectFileBtn.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]17,[System.Int32]51))
$selectFileBtn.Name = [System.String]'selectFileBtn'
$selectFileBtn.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]5))
$selectFileBtn.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]175,[System.Int32]44))
$selectFileBtn.TabIndex = [System.Int32]1
$selectFileBtn.Text = [System.String]'Select file/s'
$selectFileBtn.UseVisualStyleBackColor = $true
$selectFileBtn.add_Click($button2_Click)
#
#appHeader
#
$appHeader.AutoSize = $true
$appHeader.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]13,[System.Int32]10))
$appHeader.Name = [System.String]'appHeader'
$appHeader.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]178,[System.Int32]24))
$appHeader.TabIndex = [System.Int32]0
$appHeader.Text = [System.String]'Convert to pdf'
$appHeader.add_Click($label1_Click_1)
#
#github
#
$github.BackColor = [System.Drawing.Color]::Transparent
$github.Cursor = [System.Windows.Forms.Cursors]::Hand
$github.Image = ([System.Drawing.Image]$resources.'github.Image')
$github.InitialImage = ([System.Drawing.Image]$resources.'github.InitialImage')
$github.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]695,[System.Int32]2))
$github.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$github.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]32,[System.Int32]32))
$github.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]32,[System.Int32]32))
$github.Name = [System.String]'github'
$github.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]32,[System.Int32]32))
$github.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$github.TabIndex = [System.Int32]5
$github.TabStop = $false
#
#convertFileName
#
$convertFileName.AutoSize = $true
$convertFileName.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]3,[System.Int32]407))
$convertFileName.Name = [System.String]'convertFileName'
$convertFileName.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]0,[System.Int32]24))
$convertFileName.TabIndex = [System.Int32]4
#
#fileList
#
$fileList.BackColor = [System.Drawing.Color]::WhiteSmoke
$fileList.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$fileList.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]3,[System.Int32]51))
$fileList.Multiline = $true
$fileList.Name = [System.String]'fileList'
$fileList.ReadOnly = $true
$fileList.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]724,[System.Int32]346))
$fileList.TabIndex = [System.Int32]0
$fileList.Text = [System.String]'The list of converted file will show here after conversion.'
#
#convertTitle
#
$convertTitle.AutoEllipsis = $true
$convertTitle.AutoSize = $true
$convertTitle.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]3,[System.Int32]10))
$convertTitle.Name = [System.String]'convertTitle'
$convertTitle.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]274,[System.Int32]24))
$convertTitle.TabIndex = [System.Int32]3
$convertTitle.Text = [System.String]'No file converted, yet'
#
#OpenPptxModal
#
$OpenPptxModal.Filter = [System.String]'Powerpoint (*.pptx;)|*.pptx;'
$OpenPptxModal.InitialDirectory = [System.String]'C:\'
$OpenPptxModal.Multiselect = $true
$OpenPptxModal.Title = [System.String]'Select Powerpoint files'
#
#appMenu
#
$appMenu.AutoSize = $false
$appMenu.Dock = [System.Windows.Forms.DockStyle]::None
$appMenu.GripMargin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]2))
$appMenu.Items.AddRange([System.Windows.Forms.ToolStripItem[]]@($about,$exit))
$appMenu.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$appMenu.Name = [System.String]'appMenu'
$appMenu.RightToLeft = [System.Windows.Forms.RightToLeft]::No
$appMenu.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]1040,[System.Int32]27))
$appMenu.TabIndex = [System.Int32]1
$appMenu.Text = [System.String]'appMenu'
#
#about
#
$about.Name = [System.String]'about'
$about.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]59,[System.Int32]23))
$about.Text = [System.String]'About'
#
#exit
#
$exit.Name = [System.String]'exit'
$exit.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]42,[System.Int32]23))
$exit.Text = [System.String]'Exit'
#
#pptxToPdf
#
$pptxToPdf.AccessibleDescription = [System.String]'Github'
$pptxToPdf.AutoSize = $true
$pptxToPdf.BackColor = [System.Drawing.Color]::Black
$pptxToPdf.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]984,[System.Int32]501))
$pptxToPdf.Controls.Add($mainContainer)
$pptxToPdf.Controls.Add($appMenu)
$pptxToPdf.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Fira Code',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$pptxToPdf.ForeColor = [System.Drawing.Color]::White
$pptxToPdf.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$pptxToPdf.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$pptxToPdf.MainMenuStrip = $appMenu
$pptxToPdf.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]1000,[System.Int32]540))
$pptxToPdf.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]1000,[System.Int32]540))
$pptxToPdf.Name = [System.String]'pptxToPdf'
$pptxToPdf.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]20))
$pptxToPdf.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$pptxToPdf.Text = [System.String]'pptxToPdf'
$pptxToPdf.add_Load($pptxToPdf_Load)
$mainContainer.Panel1.ResumeLayout($false)
$mainContainer.Panel1.PerformLayout()
$mainContainer.Panel2.ResumeLayout($false)
$mainContainer.Panel2.PerformLayout()
([System.ComponentModel.ISupportInitialize]$mainContainer).EndInit()
$mainContainer.ResumeLayout($false)
([System.ComponentModel.ISupportInitialize]$github).EndInit()
$appMenu.ResumeLayout($false)
$appMenu.PerformLayout()
$pptxToPdf.ResumeLayout($false)
Add-Member -InputObject $pptxToPdf -Name selectFileBtn -Value $selectFileBtn -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name OpenPptxModal -Value $OpenPptxModal -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name mainContainer -Value $mainContainer -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name convertProgression -Value $convertProgression -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name convertTitle -Value $convertTitle -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name convertFileName -Value $convertFileName -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name percentage -Value $percentage -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name appHeader -Value $appHeader -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name github -Value $github -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name about -Value $about -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name exit -Value $exit -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name appMenu -Value $appMenu -MemberType NoteProperty
Add-Member -InputObject $pptxToPdf -Name fileList -Value $fileList -MemberType NoteProperty
}
. InitializeComponent
