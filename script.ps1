# Lê o arquivo txt
$lines = Get-Content -Path 'D:\MangaList\Manga list .txt'

# Cria um array para armazenar os objetos
$mangas = @()

foreach ($line in $lines) {
    # Divide a linha em partes
    $parts = $line -split '>'

    # Cria um objeto PS com as partes
    $manga = New-Object PSObject -Property @{
        'Nome' = $parts[0].Trim()
        'Capitulo' = if ($parts.Count -gt 1) { $parts[1].Trim() } else { "" }
        'Status' = if ($parts.Count -gt 2) { $parts[2].Trim() } else { "" }
        'MAL' = if ($parts.Count -gt 3) { $parts[3].Trim() } else { "" }
    }

    # Adiciona o objeto ao array
    $mangas += $manga
}

# Converte o array para JSON
$json = $mangas | ConvertTo-Json

# Imprime o JSON
Write-Output $json

# Salva o JSON em um arquivo
$json | Out-File -FilePath 'D:\MangaList\MangaList.json'