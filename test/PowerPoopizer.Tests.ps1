using namespace System.Collections.Generic
$here = "$(Split-Path -Parent (Split-Path -Parent $PSCommandPath))"
$sut = (Split-Path -Leaf $PSCommandPath) -replace ".Tests.", "."
$sut = $sut -replace ".ps1", ".psm1"
$base = Split-Path $sut -LeafBase
Import-Module "$here/$base/$sut" -Force -Scope Local
Describe "main" {
    BeforeAll {
        $here = "$(Split-Path -Parent (Split-Path -Parent $PSCommandPath))"
        $sut = (Split-Path -Leaf $PSCommandPath) -replace ".Tests.", "."
        $sut = $sut -replace ".ps1", ".psm1"
        $base = Split-Path $sut -LeafBase
        Import-Module "$here/$base/$sut" -Force -Scope Local
    }
    It "can pooping 1" {
        $res = Invoke-Expression(Get-PoopFromNum 1)
        $res | Should -Be "1"
    }
    It "can't pooping 10" {
        try {
            Get-PoopFromNum 10
        }
        catch {
            $_.Exception.Message | Should -Be "Warning: Get-PoopFromNum encountered a parameter error"
        }
    }
    It "can't pooping -1" {
        try {
            Get-PoopFromNum -1
        }
        catch {
            $_.Exception.Message | Should -Be "Warning: Get-PoopFromNum encountered a parameter error"
        }
    }
    It "can pooping a" {
        $res = Invoke-Expression(Get-PoopFromChar "a")
        $res | Should -Be "a"   
    }
    It "can pooping A" {
        $res = Invoke-Expression(Get-PoopFromChar "A")
        $res | Should -Be "A"   
    }
    It "can pooping one A" {
        $res = Get-PoopFromChar "A"
        $res | Should -Be "`$([char][int]`"`$(`"`$([int[]][char[]]`"💩`"[1])`"[1])`$(`"`$([int[]][char[]]`"💩`"[1])`"[0])`")"
    }
    It "get pooping from '<target>'" -TestCases @(
        @{target = "1"}
        @{target = "2"}
        @{target = "3"}
        @{target = "4"}
        @{target = "5"}
        @{target = "6"}
        @{target = "7"}
        @{target = "8"}
        @{target = "9"}
        @{target = "0"}
     ) {
        $res = Invoke-Expression(Get-PoopFromChar $target)
        $res | Should -Not -Be $null
        $res | Should -Not -Be ''
        $res | Should -Be $target
    }
    It "123" {
        $res = Invoke-Expression (Get-PoopsFromString "123")
        $res | Should -Be "123"
    }
    It "get poop string from '<target>'" -TestCases @(
        @{target = "67"}
        @{target = "aa"}
        @{target = "AA"}
        @{target = "A1"}
     ) {
        $res = Invoke-Expression $(Get-PoopsFromString $target)
        # $res = "$(Get-PoopsFromString "ABC")"
        $res | Should -Be $target
    }
    AfterAll {
    }
}
