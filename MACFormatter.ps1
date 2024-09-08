#Script to process entered MAC address into different formats (:, -, etc) for use with different platforms

Write-Host @"

1. - Initial Release

****************************
*                          *
*  MAC Address Formatting  * 
*      Version 1.0         *
*       galvitho@          *
****************************

"@

#Input Prompt
Write-Host "`nEnter a MAC Address"

$EnteredMAC = Read-Host -Prompt '=>'

#Removing any existing special characters 
#The \w metacharacter is used to find a word character. A word character is a character from a-z, A-Z, 0-9, including the _ (underscore) character. Here we use \W which remove everything that is not a word character. 
$filteredMAC = $enteredmac.ToLower() -replace '[\W]', ''

#Catch to check if enter string is correct character length for a MAC address (12 characters)after removing special characters

if($filteredMAC.Length -ne 12)
    {
        Write-Output "`nNot a valid MAC Address length. Enter a MAC Address"
        $EnteredMAC = Read-Host -Prompt '=>'
    }

#Splitting of string into individual characters
#The first number indicates that we want to begin the substring at character X, and the 2nd number indicates that we want to capture Y characters.
$MAC1 = $filteredMAC.Substring(0,2).ToLower()
$MAC2 = $filteredMAC.Substring(2,2).ToLower()
$MAC3 = $filteredMAC.Substring(4,2).ToLower()
$MAC4 = $filteredMAC.Substring(6,2).ToLower()
$MAC5 = $filteredMAC.Substring(8,2).ToLower()
$MAC6 = $filteredMAC.Substring(10,2).ToLower()

#Processing string of characters and outputting to console

Write-Host $MAC1":"$MAC2":"$MAC3":"$MAC4":"$MAC5":"$MAC6
Write-Host $MAC1""$MAC2""$MAC3""$MAC4""$MAC5""$MAC6
Write-Host $MAC1"-"$MAC2"-"$MAC3"-"$MAC4"-"$MAC5"-"$MAC6

