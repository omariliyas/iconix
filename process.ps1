Add-Type -AssemblyName System.Drawing

$inputFile = "C:\Users\omari\.gemini\antigravity\brain\b4545a95-d62e-4350-a1d8-e8db5cb8987e\media__1777410538460.png"
$outputFile = "C:\Users\omari\.gemini\antigravity\scratch\iconix-website\assets\logo.png"

$img = [System.Drawing.Bitmap]::FromFile($inputFile)
$outImg = New-Object System.Drawing.Bitmap $img.Width, $img.Height

for ($x = 0; $x -lt $img.Width; $x++) {
    for ($y = 0; $y -lt $img.Height; $y++) {
        $pixel = $img.GetPixel($x, $y)
        
        # Calculate alpha based on the red channel (white background has R=255, blue text has low R)
        # We invert it: 255 - R. We multiply by 1.2 to boost opacity of the text.
        $alpha = [math]::Floor((255 - $pixel.R) * 1.2)
        
        if ($alpha -gt 255) { $alpha = 255 }
        if ($alpha -lt 0) { $alpha = 0 }

        # For text, we make it pure white with the calculated alpha
        $newPixel = [System.Drawing.Color]::FromArgb($alpha, 255, 255, 255)
        $outImg.SetPixel($x, $y, $newPixel)
    }
}

$outImg.Save($outputFile, [System.Drawing.Imaging.ImageFormat]::Png)
$img.Dispose()
$outImg.Dispose()
