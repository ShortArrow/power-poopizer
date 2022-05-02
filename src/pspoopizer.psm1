<#
.SYNOPSIS
Output Poop from src char
.EXAMPLE
Get-PoopFromChar -src "a"
#>
function Get-PoopFromChar {
    Param
    (
        [Parameter(Position = 1)]
        [char] $src = ""
    )
    
    switch ($src) {
        {$_ -match "[0-9]"} { return "$(Get-PoopFromNum ([int]$src))" }
        {$_ -match "[a-zA-Z]"} { return "`$(`[char][int]`"`$($(
                            Get-PoopFromNum $(
                                ([char[]][string][int][char]$src)[0]
                            )
                        ))`$($(
                            Get-PoopFromNum $(
                                ([char[]][string][int][char]$src)[1]
                            )
                        ))`")" }
        Default { return "" }
    }
}

<#
.SYNOPSIS
Output Poop string from Num
.EXAMPLE
Get-PoopFromNum -src "1"
#>
function Get-PoopFromNum {
    Param
    (
        [Parameter(Position = 1)]
        [char] $src = ""
    )
    
    switch ($src) {
        1 { return "`"`$(([int[]][char[]]`"💩`")[1]%([int[]][char[]]`"💩`")[0])`"[0]" }
        2 { return "`"`$(([int[]][char[]]`"💩`")[1]-([int[]][char[]]`"💩`")[0])`"[-1]" }
        3 { return "`"`$(([int[]][char[]]`"💩`")[1]*([int[]][char[]]`"💩`")[1])`"[0]" }
        4 { return "`"`$(([int[]][char[]]`"💩`")[0]+([int[]][char[]]`"💩`")[0])`"[-1]" }
        5 { return "`"`$([int[]][char[]]`"💩`"[1])`"[0]" }
        6 { return "`"`$([int[]][char[]]`"💩`"[1])`"[1]" }
        7 { return "`"`$([int[]][char[]]`"💩`"[0])`"[-1]" }
        8 { return "`"`$(([int[]][char[]]`"💩`")[1]+([int[]][char[]]`"💩`")[1])`"[-1]" }
        9 { return "`"`$([int[]][char[]]`"💩`"[1])`"[-1]" }
        0 { return "`"`$(([int[]][char[]]`"💩`")[0]*([int[]][char[]]`"💩`")[0])`"[1]" }
        Default { return "" }
    }
}

<#
.SYNOPSIS
Output fizzbuzz with unko
.EXAMPLE
Get-UnkoFizzBuzz -Begin 30 -End 1
#>
function Get-PoopsFromString {
    
    Param
    (
        [Parameter(Position = 1)]
        [string] $src = ""
    )
    $res = ""
    foreach ($item in [char[]]$src) {
        $res += "`$($(Get-PoopFromChar $item))"
    }
    return "`"$res`""
}

<#
.SYNOPSIS
Output fizzbuzz with unko
.EXAMPLE
Get-UnkoFizzBuzz -Begin 30 -End 1
#>
function Get-UnkoFizzBuzz {
    Param
    (
        [Parameter(Position = 1)]
        [Int32] $Begin = 1,
        [Parameter(Position = 2)]
        [Int32] $End = 10
    )

    $FizzMessage = "💩 < Fizz!"
    $BuzzMessage = "🍺 < Buzz!"
    $FizzBuzzMessage = "💩🍺 < FizzBuzz!"

    foreach ($i in $Begin..$End) {
        switch ($i) {
            { $i % 3 -eq 0 } { Write-Output $FizzMessage };
            { $i % 5 -eq 0 } { Write-Output $BuzzMessage };
            { $i % 15 -eq 0 } { Write-Output $FizzBuzzMessage };
            Default { Write-Output $i };
        }
    }
}

<#
.SYNOPSIS
Search CSV data for a word that means "poop"
.EXAMPLE
Get-UnkoDictionary -Name "う" -Language "Ja"
#>
function Get-UnkoDictionary {
    Param
    (
        [String] $Name,
        [String] $Language
    )

    Import-Csv ./lib/unko.csv | Where-Object {
        ($_.Name -ILike "*${Name}*") -and ($_.Language -ILike "*${Language}*")
    }
}

<#
.SYNOPSIS
Output king unko
#>
function Get-UnkoKing {
    Param
    (
        [Parameter(Position = 1)]
        [Int32] $Height = 10,

        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String] $Unko = "💩",
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String] $Eye = "👁",
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String] $Nose = "👃",
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String] $Mouth = "👄",
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String] $Crown = "👑",
        [Parameter(ValueFromPipelineByPropertyName = $true)]
        [String] $Space = "　"
    )


    for ($i = 1; $i -lt $Height; $i++) {
        switch ($i) {
            1 {
                # Output crown
                $padding = [String] $space * [Int32] ($Height + 1)
                Write-Output "${padding}${crown}${padding}"
            }
            3 {
                # Output eye
                $unkoWithEye = "${unko}${eye}${unko}${eye}${unko}"
                $padding = [String] $space * [Int32] ($Height - ($i - 1))
                Write-Output ("{0}（{1}）{2}" -f $padding, $unkoWithEye, $padding)
            }
            4 {
                $unkoWithNose = "${unko}${unko}${unko}${nose}${unko}${unko}${unko}" 
                $padding = [String] $space * [Int32] ($Height - ($i - 1))
                Write-Output ("{0}（{1}）{2}" -f $padding, $unkoWithNose, $padding)
            }
            5 {
                # Output mouth
                $unkoList = [String[]] @($unko) * [Int32] (2 * $i - 1)
                $unkoList[4] = $mouth
                $padding = [String] $space * [Int32] ($Height - ($i - 1))
                Write-Output ("{0}（{1}）{2}" -f $padding, (-join $unkoList), $padding)
            }
            Default {
                # Output unko
                $repeatedUnko = [String] $unko * [Int32] (2 * $i - 1)
                $padding = [String] $space * [Int32] ($Height - ($i - 1))
                Write-Output ("{0}（{1}）{2}" -f $padding, $repeatedUnko, $padding)
            }
        }
    }
}

<#
.SYNOPSIS
Set window title of your teminal to unko
#>
function Set-WindowTitleToUnko {
    $host.UI.RawUI.WindowTitle = (Get-UnkoDictionary).Name | Get-Random
}

<#
.SYNOPSIS
Show big unko on your terminal
#>
function Get-BigUnko {
    $base64Text = (Get-Content ./lib/bigunko.txt) -join ""
    $bytes = [System.Convert]::FromBase64String($base64Text)
    $unko = [System.Text.Encoding]::UTF8.GetString($bytes)
    Write-Output $unko.Replace("\033", "$([char]0x1b)").Replace("\n", "")
}