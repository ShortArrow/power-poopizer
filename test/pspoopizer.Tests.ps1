using namespace System.Collections.Generic
$here = "$(Split-Path -Parent (Split-Path -Parent $PSCommandPath))"
$sut = (Split-Path -Leaf $PSCommandPath) -replace ".Tests.", "."
$sut = $sut -replace ".ps1", ".psm1"
. $here/src/$sut
Describe "main" {
    BeforeAll {
        
    }
    It "can split string by every comma" {
        
        1 | Should -Be 1
    }
    It "not lost existing value before processing" {
        2 | Should -Be 2
    }
    It "union test split Insert" {
        33 | Should -Be 33
    }
}