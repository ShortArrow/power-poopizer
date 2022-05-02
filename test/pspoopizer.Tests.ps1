using namespace System.Collections.Generic
$here = "$(Split-Path -Parent (Split-Path -Parent $PSCommandPath))"
$sut = (Split-Path -Leaf $PSCommandPath) -replace ".Tests.", "."
$sut = $sut -replace ".ps1", ".psm1"
Import-Module $here/src/$sut -Force -Scope Local
Describe "main" {
    BeforeAll {
        Import-Module $here/src/$sut -Force -Scope Local
    }
    It "can pooping one a" {
        $res = Invoke-Expression(Get-PoopFromChar "a")
        $res | Should -Be "a"
        
    }
    It "can pooping one 1" {
        $res = Invoke-Expression(Get-PoopFromChar "1")
        $res | Should -Be "1"
    }
    It "union test split Insert" {
        $res = Invoke-Expression(Get-PoopsFromString "unko")
        $res | Should -Be "unko"
    }
    AfterAll {
    }
}
