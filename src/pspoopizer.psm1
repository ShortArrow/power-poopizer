<#
.SYNOPSIS
Output fizzbuzz with unko
.EXAMPLE
Get-UnkoFizzBuzz -Begin 30 -End 1
#>
function Get-PoopFromChar {
    
    Write-Host("契約書だよ。そこに名前を書きな。")
    
    $keiyakusho=Read-Host
    $name=$keiyakusho

    Write-Host("フン。"+$name +"というのかい。贅沢な名だねぇ。")

    $newNameIndex = Get-Random(($name).Length)
    $newName = $name.Substring($newNameIndex, 1)

    Write-Host("今からお前の名前は"+$newName+"だ。いいかい、"+$newName+"だよ。分かったら返事をするんだ、"+$newName+"!!")
}

<#
.SYNOPSIS
Output fizzbuzz with unko
.EXAMPLE
Get-UnkoFizzBuzz -Begin 30 -End 1
#>
function Get-PoopsFromString {
    
    Write-Host("契約書だよ。そこに名前を書きな。")
    
    $keiyakusho=Read-Host
    $name=$keiyakusho

    Write-Host("フン。"+$name +"というのかい。贅沢な名だねぇ。")

    $newNameIndex = Get-Random(($name).Length)
    $newName = $name.Substring($newNameIndex, 1)

    Write-Host("今からお前の名前は"+$newName+"だ。いいかい、"+$newName+"だよ。分かったら返事をするんだ、"+$newName+"!!")
}

<#
.SYNOPSIS
Output fizzbuzz with unko
.EXAMPLE
Get-UnkoFizzBuzz -Begin 30 -End 1
#>
function Get-UnkoFizzBuzz
{
    Param
    (
        [Parameter(Position=1)]
        [Int32] $Begin = 1,
        [Parameter(Position=2)]
        [Int32] $End = 10
    )

    $FizzMessage = "💩 < Fizz!"
    $BuzzMessage = "🍺 < Buzz!"
    $FizzBuzzMessage = "💩🍺 < FizzBuzz!"

    foreach ($i in $Begin..$End) {
        switch ($i) {
        {$i % 3 -eq 0} { Write-Output $FizzMessage };
        {$i % 5 -eq 0} { Write-Output $BuzzMessage };
        {$i % 15 -eq 0} { Write-Output $FizzBuzzMessage };
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
function Get-UnkoDictionary
{
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
function Get-UnkoKing
{
    Param
    (
        [Parameter(Position=1)]
        [Int32] $Height = 10,

        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [String] $Unko = "💩",
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [String] $Eye = "👁",
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [String] $Nose = "👃",
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [String] $Mouth = "👄",
        [Parameter(ValueFromPipelineByPropertyName=$true)]
        [String] $Crown = "👑",
        [Parameter(ValueFromPipelineByPropertyName=$true)]
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
function Set-WindowTitleToUnko
{
    $host.UI.RawUI.WindowTitle = (Get-UnkoDictionary).Name | Get-Random
}

<#
.SYNOPSIS
Show big unko on your terminal
#>
function Get-BigUnko
{
    $base64Text = (Get-Content ./lib/bigunko.txt) -join ""
    $bytes = [System.Convert]::FromBase64String($base64Text)
    $unko = [System.Text.Encoding]::UTF8.GetString($bytes)
    Write-Output $unko.Replace("\033", "$([char]0x1b)").Replace("\n", "")
}