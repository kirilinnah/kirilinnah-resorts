$files = @(
    'C:/Users/260141/Downloads/madang01.png',
    'C:/Users/260141/Downloads/rondon01.png'
)

foreach ($f in $files) {
    if (-Not (Test-Path $f)) {
        Write-Output "MISSING: $f"
        continue
    }
    $item = Get-Item $f
    Write-Output "$f : $([math]::Round($item.Length/1MB,2)) MB"
}
