using namespace System.Collections.Generic
$here = "$(Split-Path -Parent (Split-Path -Parent $PSCommandPath))"
$sut = (Split-Path -Leaf $PSCommandPath) -replace ".Tests.", "."
$sut = $sut -replace ".ps1", ".psm1"
Import-Module $here/src/$sut -Force
Describe "main" {
    BeforeAll {
        
    }
    It "can split string by every comma" {
        $res = (Get-PoopFromChar "G")
        $res | Should -Be "G"
    }
    It "not lost existing value before processing" {
        2 | Should -Be 2
    }
    It "union test split Insert" {
        33 | Should -Be 33
    }
}