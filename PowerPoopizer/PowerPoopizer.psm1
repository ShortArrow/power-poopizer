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
        { $_ -match "[0-9]" } { return "$($(Get-PoopFromNum ([int]"$src")))" }
        { $_ -match "[a-zA-Z]" } {
            return "`$(`[char][int]`"`$($(
                            Get-PoopFromNum $("$(([char[]][string][int][char]$src)[0])")
                            ))`$($(
                            Get-PoopFromNum $("$(([char[]][string][int][char]$src)[1])")
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
        [int]$src = 0
    )
    if ([int]'0' -gt $src -or $src -gt [int]'9') {
        throw "Warning: Get-PoopFromNum encountered a parameter error"
    }
    
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
Output poop string from normal string
.EXAMPLE
Get-PoopsFromString -src srcstring
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
        [Int32] $Height = 10
    )

    $LightPoop = "`e[48;5;15m💩`e[0m"
    $DarkPoop = "`e[48;5;1m💩`e[0m"
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
    Param()
    $Reverse = "$($PSStyle.Reverse)"
    $Blink = "$($PSStyle.Blink)"
    $PoopRed = "$($PSStyle.Foreground.Red)💩"
    $PoopGreen = "$($PSStyle.Foreground.Green)💩"
    $PoopBlue = "$($PSStyle.Foreground.Blue)💩"
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
        [Parameter(Position = 2)]
        [switch] $BoostClean = $false
    )
    $Interval = $Seconds / $Width * 1000
    $Water = "$($PSStyle.BackGround.BrightCyan)　$($PSStyle.Reset)"
    $Gap = $BoostClean ? "💩" : "　"
    $Toilet = "🚽--"
    $FrontBracket = "["
    $BackBracket = "]"
    $GoFront = "`e[0G"
    for ($i = 1; $i -le $Width; $i++ ) {
        $Ratio = "{0:0.0}%" -f $([Math]::Round($i/$Width *100, 1, [MidpointRounding]::AwayFromZero))
        $PoopWay = "$($Water*($i-1)+"$($PSStyle.BackGround.BrightCyan)💩$($PSStyle.Reset)"+$Gap*($Width-$i))"
        Write-Host "$($GoFront + $FrontBracket +$PoopWay + $BackBracket + $Toilet + $Ratio)" -NoNewline
        Start-Sleep -Milliseconds $Interval
    }
    Write-Host ""
}
