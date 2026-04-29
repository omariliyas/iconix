Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\omari\.gemini\antigravity\scratch\iconix-website\assets\partners.png")
$cols = 5
$rows = 2
$w = [math]::Floor($img.Width / $cols)
$h = [math]::Floor($img.Height / $rows)

for ($r = 0; $r -lt $rows; $r++) {
    for ($c = 0; $c -lt $cols; $c++) {
        $idx = $r * $cols + $c + 1
        if ($idx -le 9) {
            $rect = New-Object System.Drawing.Rectangle ($c*$w), ($r*$h), $w, $h
            $bmp = $img.Clone($rect, $img.PixelFormat)
            $bmp.Save("C:\Users\omari\.gemini\antigravity\scratch\iconix-website\assets\partner$idx.png", [System.Drawing.Imaging.ImageFormat]::Png)
            $bmp.Dispose()
        }
    }
}
$img.Dispose()
