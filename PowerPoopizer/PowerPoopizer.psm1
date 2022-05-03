# Copyright 2022 @ShortArrow
# The source code is licensed MIT. The website content is licensed CC BY 4.0, see LICENSE.

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
        [char] $Src = "",
        [Parameter(Position = 2)]
        [string] $OverridePoop = "💩"
    )
    
    switch ($Src) {
        { $_ -match "[0-9]" } { return "$($(Get-PoopFromNum ([int]"$Src") -OverridePoop $OverridePoop))" }
        { $_ -match "[a-zA-Z]" } {
            return "`$(`[char][int]`"`$($(
                            Get-PoopFromNum $("$(([char[]][string][int][char]$Src)[0])") -OverridePoop $OverridePoop
                            ))`$($(
                            Get-PoopFromNum $("$(([char[]][string][int][char]$Src)[1])") -OverridePoop $OverridePoop
                        ))`")" 
        }
        Default { return "" }
    }
}

<#
.SYNOPSIS
Output Poop string from Number of single digit
.EXAMPLE
Get-PoopFromNum -src 1
#>
function Get-PoopFromNum {
    Param
    (
        [Parameter(Position = 1)]
        [int]$Src = 0,
        [Parameter(Position = 2)]
        [string] $OverridePoop = "💩"
    )
    if ([int]'0' -gt $Src -or $Src -gt [int]'9') {
        throw "Warning: Get-PoopFromNum encountered a parameter error"
    }
    
    switch ($Src) {
        1 { return "`"`$(([int[]][char[]]`"$($OverridePoop)`")[1]%([int[]][char[]]`"$($OverridePoop)`")[0])`"[0]" }
        2 { return "`"`$(([int[]][char[]]`"$($OverridePoop)`")[1]-([int[]][char[]]`"$($OverridePoop)`")[0])`"[-1]" }
        3 { return "`"`$(([int[]][char[]]`"$($OverridePoop)`")[1]*([int[]][char[]]`"$($OverridePoop)`")[1])`"[0]" }
        4 { return "`"`$(([int[]][char[]]`"$($OverridePoop)`")[0]+([int[]][char[]]`"$($OverridePoop)`")[0])`"[-1]" }
        5 { return "`"`$([int[]][char[]]`"$($OverridePoop)`"[1])`"[0]" }
        6 { return "`"`$([int[]][char[]]`"$($OverridePoop)`"[1])`"[1]" }
        7 { return "`"`$([int[]][char[]]`"$($OverridePoop)`"[0])`"[-1]" }
        8 { return "`"`$(([int[]][char[]]`"$($OverridePoop)`")[1]+([int[]][char[]]`"$($OverridePoop)`")[1])`"[-1]" }
        9 { return "`"`$([int[]][char[]]`"$($OverridePoop)`"[1])`"[-1]" }
        0 { return "`"`$(([int[]][char[]]`"$($OverridePoop)`")[0]*([int[]][char[]]`"$($OverridePoop)`")[0])`"[1]" }
        Default { return "" }
    }
}

<#
.SYNOPSIS
Output poop string from normal string
.EXAMPLE
Get-PoopsFromString -src srcstring
#>
function Get-PoopsFromString {
    
    Param
    (
        [Parameter(Position = 1)]
        [string] $Src = "",
        [Parameter(Position = 2)]
        [string] $OverridePoop = "💩"
    )
    $res = ""
    foreach ($item in [char[]]$Src) {
        $res += "`$($(Get-PoopFromChar $item -OverridePoop $OverridePoop))"
    }
    return "`$(`"$res`")"
}

<#
.SYNOPSIS
Output Poop Happy Checker
.EXAMPLE
Get-PoopHappyChecker -Width 30 -Height 10
#>
function Get-PoopHappyChecker {
    Param
    (
        [Parameter(Position = 1)]
        [Int32] $Width = 60,
        [Parameter(Position = 2)]
        [Int32] $Height = 10,
        [Parameter(Position = 3)]
        [string] $OverridePoop = "💩"
    )

    $LightPoop = "`e[48;5;15m$($OverridePoop)`e[0m"
    $DarkPoop = "`e[48;5;1m$($OverridePoop)`e[0m"
    $RightDirectionPoopBar = ($LightPoop + $DarkPoop) * ($Width / 2)
    $ReverseDirectionPoopBar = ($DarkPoop + $LightPoop) * ($Width / 2)
    $WallPoops = ($RightDirectionPoopBar + $ReverseDirectionPoopBar) * ($Height / 2)
    write-host $WallPoops
}

<#
.SYNOPSIS
Output Blinking Poop
.EXAMPLE
Get-PoopBlink
#>
function Get-UnkoBlink {
    Param(
        [Parameter(Position = 1)]
        [string] $OverridePoop = "💩"
    )
    $Reverse = "$($PSStyle.Reverse)"
    $Blink = "$($PSStyle.Blink)"
    $PoopRed = "$($PSStyle.Foreground.Red)$($OverridePoop)"
    $PoopGreen = "$($PSStyle.Foreground.Green)$($OverridePoop)"
    $PoopBlue = "$($PSStyle.Foreground.Blue)$($OverridePoop)"
    $Reset = "$($PSStyle.Reset)"
    Write-Host "$($Reverse+$Blink+$PoopRed+$PoopGreen+$PoopBlue+$Reset)"
}

<#
.SYNOPSIS
Poop Sink Progress
.EXAMPLE
Show-PoopProgress -Width 10 -Seconds 10
#>
function Show-PoopProgress {
    Param
    (
        [Parameter(Position = 1)]
        [Int32] $Width = 10,
        [Parameter(Position = 2)]
        [Int32] $Seconds = 10,
        [Parameter(Position = 3)]
        [switch] $BoostClean = $false,
        [Parameter(Position = 4)]
        [string] $OverridePoop = "💩",
        [Parameter(Position = 5)]
        [string] $OverrideToilet = "🚽--",
        [Parameter(Position = 6)]
        [string] $OverrideFrontBracket = "[",
        [Parameter(Position = 7)]
        [string] $OverrideBackBracket = "]"
    )
    $Interval = $Seconds / $Width * 1000
    $Water = "$($PSStyle.BackGround.BrightCyan)　$($PSStyle.Reset)"
    $Gap = $BoostClean ? "$($OverridePoop)" : "　"
    $GoFront = "`e[0G"
    for ($i = 1; $i -le $Width; $i++ ) {
        $Ratio = "{0:0.0}%" -f $([Math]::Round($i/$Width *100, 1, [MidpointRounding]::AwayFromZero))
        $PoopWay = "$($Water*($i-1)+"$($PSStyle.BackGround.BrightCyan)$($OverridePoop)$($PSStyle.Reset)"+$Gap*($Width-$i))"
        Write-Host "$($GoFront + $OverrideFrontBracket +$PoopWay + $OverrideBackBracket + $OverrideToilet + $Ratio)" -NoNewline
        Start-Sleep -Milliseconds $Interval
    }
    Write-Host ""
}
