Add-Type -AssemblyName System.Drawing
$files = @(
    'C:/Users/260141/Downloads/vanimo01.png',
    'C:/Users/260141/Downloads/madang01.png',
    'C:/Users/260141/Downloads/rondon01.png',
    'C:/Users/260141/Downloads/ambua01.png',
    'C:/Users/260141/Downloads/tufi01.png',
    'C:/Users/260141/Downloads/loloata01.png',
    'C:/Users/260141/Downloads/rapopo01.png',
    'C:/Users/260141/Downloads/lissenung01.png'
)

foreach ($f in $files) {
    if (-Not (Test-Path $f)) {
        Write-Output "MISSING: $f"
        continue
    }

    try {
        $img = [System.Drawing.Image]::FromFile($f)
        $thumb = New-Object System.Drawing.Bitmap 100, 100
        $g = [System.Drawing.Graphics]::FromImage($thumb)
        $g.DrawImage($img, 0, 0, 100, 100)
        $g.Dispose()

        $totalR = 0
        $totalG = 0
        $totalB = 0
        $count = 0
        for ($x = 0; $x -lt 100; $x++) {
            for ($y = 0; $y -lt 100; $y++) {
                $c = $thumb.GetPixel($x, $y)
                $totalR += $c.R
                $totalG += $c.G
                $totalB += $c.B
                $count++
            }
        }
        $avgR = [math]::Round($totalR / $count)
        $avgG = [math]::Round($totalG / $count)
        $avgB = [math]::Round($totalB / $count)

        $dominant = if ($avgR -gt $avgG -and $avgR -gt $avgB) { 'red' } elseif ($avgG -gt $avgB) { 'green' } else { 'blue' }

        Write-Output "--- $($f) : $($img.Width)x$($img.Height) - avg RGB ($avgR,$avgG,$avgB) dominant=$dominant"

        $thumb.Dispose()
        $img.Dispose()
    } catch {
        Write-Output "ERROR $f : $($_.Exception.Message)"
    }
}
