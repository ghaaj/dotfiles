$profileLoading = [System.Diagnostics.Stopwatch]::StartNew()

Remove-Alias -Force -Name sl, cls, sort, ls, rmdir, echo, cat, cli, ri, del, erase, rd, rm
Set-Alias which where.exe
Set-Alias more less
Set-Alias more.com less
Set-Alias sort $HOME\scoop\apps\msys2\current\usr\bin\sort.exe
Set-Alias cat $HOME\scoop\apps\msys2\current\usr\bin\cat.exe
Set-Alias clipget Get-Clipboard
Set-Alias clipset Set-Clipboard

[Console]::InputEncoding = [Text.Encoding]::GetEncoding("UTF-8")
[Console]::OutputEncoding = [Text.Encoding]::GetEncoding("UTF-8")

function ..([ValidateRange("Positive")][Int]$level = 1) {
    $dest = Get-Item .
    foreach ($_n in 1..$level) {
        if ([String]::IsNullOrEmpty($dest.Parent)) {
            Write-Warning "Reached the root directory of the current drive $((Get-Location).Drive.Name)."
            break
        }
        else {
            $dest = $dest.Parent
        }
    }
    Set-Location $dest
}
function rm() {
    $rmArgs = $args
    function defaultBehavior() {
        & $HOME\scoop\apps\msys2\current\usr\bin\rm.exe $rmArgs
    }
    if (-not $([String]::IsNullOrEmpty($MyInvocation.PSCommandPath))) {
        defaultBehavior
        return
    }
    if (!$args -or ((Read-Host "continue? [y/N]") -match "^[Yy]$")) {
        defaultBehavior
    }
    else {
        Write-Output "Abort."
        throw
    }
}
function eval() {
    pwsh -c "$args"
}
$ezaOptions = @("--classify=auto", "--icons=auto", "--git",
    "--group-directories-first", "--header", "--time-style", "iso")
function ls() {
    eza $ezaOptions $args
}
function ll() {
    eza $ezaOptions --long $args
}

Import-Module PSReadline
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -AddToHistoryHandler { param($line)
    return $line -notmatch "^\s"
}
Set-PSReadLineKeyHandler -Chord Ctrl+d -Function DeleteCharOrExit
Set-PSReadLineKeyHandler -Chord Ctrl+k -Function KillLine
Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine
Set-PSReadLineKeyHandler -Chord Ctrl+] -Function GotoBrace
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function DeleteLine

$env:EDITOR = "nvim"
$env:VISUAL = "nvim"
Import-Module -Name Microsoft.WinGet.CommandNotFound
Import-Module syntax-highlighting
Invoke-Expression (&starship init powershell)

$profileLoading.Stop()
$profileLoadingMs = $profileLoading.ElapsedMilliseconds
$principalSays = "みなさんが静かになるまでに{0}{1}かかりました。"
if ($profileLoadingMs -gt 1000) {
    Write-Output "校長先生「$($principalSays -f ($profileLoadingMs/1000), "秒も")先生はとても悲しいです。」"
} elseif ($profileLoadingMs -gt 500) {
    Write-Output "校長先生「$($principalSays -f $profileLoadingMs, "ミリ秒")」"
}
