@{
    Root = 'c:\gitea\pptxToPdf\pptxToPdf.ps1'
    OutputPath = 'c:\gitea\pptxToPdf\out'
    Package = @{
        Enabled = $true
        Obfuscate = $false
        HideConsoleWindow = $true
        DotNetVersion = 'v4.6.2'
        FileVersion = '1.0.0'
        FileDescription = 'Converts a PowerPoint presentation to PDF in bulk'
        ProductName = 'pptxToPdf'
        ProductVersion = '1.0.0'
        Copyright = '2022'
        RequireElevation = $false
        ApplicationIconPath = 'C:\gitea\pptxToPdf\icons\pdf.ico'
        PackageType = 'Console'
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}