#Script to process entered MAC address into different formats (:, -, etc) for use with different platforms

Write-Host @"

2024-01-07 - Initial Release
2024-02-02 - Logic change to allow easier launch, bug Fixes & add '.' delimited format

****************************
*                          *
*  MAC Address Formatting  * 
*      Version 1.1         *
*       galvitho@          *
****************************

"@

do {
    do 
    {
    #Input Prompt
    Write-Host "`nEnter a MAC Address"
    $EnteredMAC = Read-Host -Prompt '=>'   
    #Removing any existing special characters 
    #The \w metacharacter is used to find a word character. A word character is a character from 
    #a-z, A-Z, 0-9, including the _ (underscore) character. Here we use \W which remove everything 
    #that is not a word character.  
    $filteredMAC = $enteredmac.ToLower() -replace '[\W]', ''
    #Catch to check if enter string is correct character length for a MAC address (12 characters)
    #after removing special characters. Only exit do-while loop if entered string is NOT NOT 12 char
    if($filteredMAC.Length -ne 12)
        {
            Write-Output "`nNot a valid MAC Address length."
        }
    } while ($filteredMAC.Length -ne 12)

#Splitting of string into individual characters
#The first number indicates that we want to begin the substring at character X, and the 2nd number 
#indicates that we want to capture Y characters.
    
$MAC1 = $filteredMAC.Substring(0,2).ToLower()
$MAC2 = $filteredMAC.Substring(2,2).ToLower()
$MAC3 = $filteredMAC.Substring(4,2).ToLower()
$MAC4 = $filteredMAC.Substring(6,2).ToLower()
$MAC5 = $filteredMAC.Substring(8,2).ToLower()
$MAC6 = $filteredMAC.Substring(10,2).ToLower()

#Processing string of characters and outputting to console

#standard format, e.g NARC
Write-Host $MAC1":"$MAC2":"$MAC3":"$MAC4":"$MAC5":"$MAC6
#No delimiters, e.g. Haystack
Write-Host $MAC1""$MAC2""$MAC3""$MAC4""$MAC5""$MAC6
#Hyphen delimiter, e.g. for IMS
Write-Host $MAC1"-"$MAC2"-"$MAC3"-"$MAC4"-"$MAC5"-"$MAC6
#Delimited every 4 chars with '.', e.g Cisco IOS switch
Write-Host $MAC1$MAC2"."$MAC3$MAC4"."$MAC5$MAC6

#Reset filtered vlaue to blank string and prompt for exit. Only exit if 'n' selected

$filteredMAC = ''
$continue = Read-Host -Prompt 'Exit? (y/n) =>'
    
} while ($continue.ToLower() -ne 'y')
