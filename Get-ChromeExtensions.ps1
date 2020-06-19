Function Get-ChromeExtensions {
<#
.SYNOPSIS
    Returns a list of installed extensions for Google Chrome
	
.DESCRIPTION
    This function checks appdata folder(s) to return a list of installed Chrome extensions for a user or computer. If ComputerName or Username is left blank, the query will run on the local system for all users.
	
.NOTES
    Written by: Dan Gassensmith
    Last Update: 2020-06-19
	
.PARAMETER ComputerName
    The hostname of the computer to query. The local system will be queried if this parameter is not specified
	
.PARAMETER Username
	The user ID (as found in C:\Users\) to query for installed extensions
	
.OUTPUTS
	name - The displayname of the extension pulled from manifest
	description - extension description pulled from manifest
	version - extension version number
	extension_id - the 32-character string id of the queried extension
	username - this is the username value for the appdata folder where the extension was found
	path - the local or UNC path where the extension is located
	
.EXAMPLE
    PS> Get-ChromeExtensions
	
	name                      description                                                              version      extension_id                     username         path
	----                      -----------                                                              -------      ------------                     --------         ----
	Slides                    Create and edit presentations                                            0.10         aapocclcgogkmnckokdopfmhonfmgoek AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\aapocclcgogkmnckokdopfmhonfmgoek\0.10_1\manifest.json
	Docs                      Create and edit documents                                                0.10         aohghmighlieiainnegkcijnfilokake AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\aohghmighlieiainnegkcijnfilokake\0.10_1\manifest.json
	Google Drive              Google Drive: create, share and keep all your stuff in one place.        14.2         apdfllckaahabafndbhieahigkjlhalf AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\apdfllckaahabafndbhieahigkjlhalf\14.2_1\manifest.json
	YouTube                                                                                            4.2.8        blpcfgokakmgnkcojhhkbfbldkacnbeo AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\blpcfgokakmgnkcojhhkbfbldkacnbeo\4.2.8_0\manifest.json
	uBlock Origin             Finally, an efficient blocker. Easy on CPU and memory.                   1.24.4       cjpalhdlnbpafiamejdnhcphjbkeiagm AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm\1.24.4_0\manifest.json
	Sheets                    Create and edit spreadsheets                                             1.2          felcaaldnbdncclmgdcncolpebgiejap AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\felcaaldnbdncclmgdcncolpebgiejap\1.2_1\manifest.json
	Google Docs Offline       Get things done offline with the Google Docs family of products.         1.7          ghbmnnjooekpmoecnnnilnnbdlolhkhi AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\ghbmnnjooekpmoecnnnilnnbdlolhkhi\1.7_1\manifest.json
	Chrome Web Store Payments Chrome Web Store Payments                                                1.0.0.5      nmmhkkegccagdldgiimedpiccmgmieda AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\nmmhkkegccagdldgiimedpiccmgmieda\1.0.0.5_0\manifest.json
	Gmail                     Fast, searchable email with less spam.                                   8.2          pjkljhegncpnkpknbcohdijeoejaedia AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\pjkljhegncpnkpknbcohdijeoejaedia\8.2_0\manifest.json
	Chrome Media Router       Provider for discovery and services for mirroring of Chrome Media Router 8320.407.0.1 pkedcjkdefgpdelpbcmbmeomcjbeemfm AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\pkedcjkdefgpdelpbcmbmeomcjbeemfm\8320.407.0.1_0\manifest.json
	Slides                    Create and edit presentations                                            0.10         aapocclcgogkmnckokdopfmhonfmgoek AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\aapocclcgogkmnckokdopfmhonfmgoek\0.10_0\manifest.json
	Docs                      Create and edit documents                                                0.10         aohghmighlieiainnegkcijnfilokake AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\aohghmighlieiainnegkcijnfilokake\0.10_0\manifest.json
	Google Drive              Google Drive: create, share and keep all your stuff in one place.        14.2         apdfllckaahabafndbhieahigkjlhalf AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\apdfllckaahabafndbhieahigkjlhalf\14.2_0\manifest.json
	YouTube                                                                                            4.2.8        blpcfgokakmgnkcojhhkbfbldkacnbeo AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\blpcfgokakmgnkcojhhkbfbldkacnbeo\4.2.8_0\manifest.json
	Sheets                    Create and edit spreadsheets                                             1.2          felcaaldnbdncclmgdcncolpebgiejap AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\felcaaldnbdncclmgdcncolpebgiejap\1.2_0\manifest.json
	Google Docs Offline       Get things done offline with the Google Docs family of products.         1.7          ghbmnnjooekpmoecnnnilnnbdlolhkhi AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\ghbmnnjooekpmoecnnnilnnbdlolhkhi\1.7_1\manifest.json
	Chrome Web Store Payments Chrome Web Store Payments                                                1.0.0.5      nmmhkkegccagdldgiimedpiccmgmieda AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\nmmhkkegccagdldgiimedpiccmgmieda\1.0.0.5_0\manifest.json
	Gmail                     Fast, searchable email with less spam.                                   8.2          pjkljhegncpnkpknbcohdijeoejaedia AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\pjkljhegncpnkpknbcohdijeoejaedia\8.2_0\manifest.json
	Chrome Media Router       Provider for discovery and services for mirroring of Chrome Media Router 8320.407.0.1 pkedcjkdefgpdelpbcmbmeomcjbeemfm AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\pkedcjkdefgpdelpbcmbmeomcjbeemfm\8320.407.0.1_0\manifest.json
	Chrome Media Router       Provider for discovery and services for mirroring of Chrome Media Router 7819.902.0.1 pkedcjkdefgpdelpbcmbmeomcjbeemfm AlsoAChromeuser C:\Users\AlsoAChromeuser\appdata\local\google\chrome\user data\default\extensions\pkedcjkdefgpdelpbcmbmeomcjbeemfm\7819.902.0.1_0\manifest.json
    
	This example gets all installed extensions for all users on the current computer.
	
.EXAMPLE
	PS> Get-ChromeExtensions -ComputerName RemotePC01 -Username YetAnotherChromeuser | ft -a
	
	name                      description                                                                                                                          version         extension_id                     username       path
	----                      -----------                                                                                                                          -------         ------------                     --------       ----
	Slides                    Create and edit presentations                                                                                                        0.10            aapocclcgogkmnckokdopfmhonfmgoek YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\aapocclcgogkmnckokdopfmhonfmgoek\0.10_0\manifest.json
	My Quick Converter        Search and access popular converter quick links instantly from your new tab page!                                                    7.0             aknlelmioblfeomeemciaomipejabhgk YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\aknlelmioblfeomeemciaomipejabhgk\7.0_0\manifest.json
	Docs                      Create and edit documents                                                                                                            0.10            aohghmighlieiainnegkcijnfilokake YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\aohghmighlieiainnegkcijnfilokake\0.10_0\manifest.json
	Google Drive              Google Drive: create, share and keep all your stuff in one place.                                                                    14.1            apdfllckaahabafndbhieahigkjlhalf YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\apdfllckaahabafndbhieahigkjlhalf\14.1_0\manifest.json
	PackageTracking           Never lose track of a package again! Easily track incoming and outgoing shipping with PackageTrackingâ„¢!                            13.931.18.11269 bamfmecoljgjbaelcceoocomemmncndn YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\bamfmecoljgjbaelcceoocomemmncndn\13.931.18.11269_0\manifest.json
	PackageTracking           Never lose track of a package again! Easily track incoming and outgoing shipping with PackageTrackingâ„¢!                            13.930.17.62268 bamfmecoljgjbaelcceoocomemmncndn YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\bamfmecoljgjbaelcceoocomemmncndn\13.930.17.62268_0\manifest.json
	YouTube                                                                                                                                                        4.2.8           blpcfgokakmgnkcojhhkbfbldkacnbeo YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\blpcfgokakmgnkcojhhkbfbldkacnbeo\4.2.8_0\manifest.json
	Sheets                    Create and edit spreadsheets                                                                                                         1.2             felcaaldnbdncclmgdcncolpebgiejap YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\felcaaldnbdncclmgdcncolpebgiejap\1.2_0\manifest.json
	Google Docs Offline       Edit, create, and view your documents, spreadsheets, and presentations â€” all without internet access.                              1.11.0          ghbmnnjooekpmoecnnnilnnbdlolhkhi YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\ghbmnnjooekpmoecnnnilnnbdlolhkhi\1.11.0_0\manifest.json
	Search Extension by Ask   Convenient browsing tools. Disabling this extension won't uninstall the associated program; for instructions: support.mindspark.com  50.186.18.6636  lgfehfbnofiffladdncogfobimealokp YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\lgfehfbnofiffladdncogfobimealokp\50.186.18.6636_0\manifest.json
	Search Extension by Ask   Convenient browsing tools. Disabling this extension won't uninstall the associated program; for instructions: support.mindspark.com  50.184.17.35688 lgfehfbnofiffladdncogfobimealokp YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\lgfehfbnofiffladdncogfobimealokp\50.184.17.35688_0\manifest.json
	My Quick Converter        Search and access popular converter quick links instantly from your new tab page!                                                    7.0             lmibdmeehggmjlpiafcbanaaecagcfmg YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\lmibdmeehggmjlpiafcbanaaecagcfmg\7.0_0\manifest.json
	Chrome Web Store Payments Chrome Web Store Payments                                                                                                            1.0.0.5         nmmhkkegccagdldgiimedpiccmgmieda YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\nmmhkkegccagdldgiimedpiccmgmieda\1.0.0.5_0\manifest.json
	Gmail                     Fast, searchable email with less spam.                                                                                               8.2             pjkljhegncpnkpknbcohdijeoejaedia YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\pjkljhegncpnkpknbcohdijeoejaedia\8.2_0\manifest.json
	Chrome Media Router       Provider for discovery and services for mirroring of Chrome Media Router                                                             8320.407.0.1    pkedcjkdefgpdelpbcmbmeomcjbeemfm YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\pkedcjkdefgpdelpbcmbmeomcjbeemfm\8320.407.0.1_0\manifest.json
	Chrome Media Router       Provider for discovery and services for mirroring of Chrome Media Router                                                             8220.319.1.2    pkedcjkdefgpdelpbcmbmeomcjbeemfm YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\pkedcjkdefgpdelpbcmbmeomcjbeemfm\8220.319.1.2_0\manifest.json
	Search Encrypt            Keep your searches private by redirecting searches that may be tracked to Search Encrypt, a privacy-focused search engine.           2.2.19          podikjakdikbemkikedommggnijhgnaj YetAnotherChromeuser \\RemotePC01\c$\Users\YetAnotherChromeuser\appdata\local\google\chrome\user data\default\extensions\podikjakdikbemkikedommggnijhgnaj\2.2.19_0\manifest.json
	
	This example gets installed extensions on computer 'RemotePC01' for user 'YetAnotherChromeuser'
	
.EXAMPLE
	PS> Get-ChromeExtensions -Username AChromeuser
	
	name                      description                                                              version      extension_id                     username         path
	----                      -----------                                                              -------      ------------                     --------         ----
	Slides                    Create and edit presentations                                            0.10         aapocclcgogkmnckokdopfmhonfmgoek AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\aapocclcgogkmnckokdopfmhonfmgoek\0.10_1\manifest.json
	Docs                      Create and edit documents                                                0.10         aohghmighlieiainnegkcijnfilokake AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\aohghmighlieiainnegkcijnfilokake\0.10_1\manifest.json
	Google Drive              Google Drive: create, share and keep all your stuff in one place.        14.2         apdfllckaahabafndbhieahigkjlhalf AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\apdfllckaahabafndbhieahigkjlhalf\14.2_1\manifest.json
	YouTube                                                                                            4.2.8        blpcfgokakmgnkcojhhkbfbldkacnbeo AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\blpcfgokakmgnkcojhhkbfbldkacnbeo\4.2.8_0\manifest.json
	uBlock Origin             Finally, an efficient blocker. Easy on CPU and memory.                   1.24.4       cjpalhdlnbpafiamejdnhcphjbkeiagm AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\cjpalhdlnbpafiamejdnhcphjbkeiagm\1.24.4_0\manifest.json
	Sheets                    Create and edit spreadsheets                                             1.2          felcaaldnbdncclmgdcncolpebgiejap AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\felcaaldnbdncclmgdcncolpebgiejap\1.2_1\manifest.json
	Google Docs Offline       Get things done offline with the Google Docs family of products.         1.7          ghbmnnjooekpmoecnnnilnnbdlolhkhi AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\ghbmnnjooekpmoecnnnilnnbdlolhkhi\1.7_1\manifest.json
	Chrome Web Store Payments Chrome Web Store Payments                                                1.0.0.5      nmmhkkegccagdldgiimedpiccmgmieda AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\nmmhkkegccagdldgiimedpiccmgmieda\1.0.0.5_0\manifest.json
	Gmail                     Fast, searchable email with less spam.                                   8.2          pjkljhegncpnkpknbcohdijeoejaedia AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\pjkljhegncpnkpknbcohdijeoejaedia\8.2_0\manifest.json
	Chrome Media Router       Provider for discovery and services for mirroring of Chrome Media Router 8320.407.0.1 pkedcjkdefgpdelpbcmbmeomcjbeemfm AChromeuser C:\Users\AChromeuser\appdata\local\google\chrome\user data\default\extensions\pkedcjkdefgpdelpbcmbmeomcjbeemfm\8320.407.0.1_0\manifest.json
	
	This example gets installed extensions for user 'AChromeuser' on the local computer
	
#>
Param(
	[String]$ComputerName,
	[String]$Username
	)
	Function Get-ChromeExtensionLocalManifest {
	Param(
		[Parameter(Mandatory=$true)]
		[String]$extension_id,
		[String]$username,
		[String]$ComputerName,
		[String]$version
		)
		if (!$username){
			$username = '*'
		}
		if (!$version){
			$version = ''
		}
		if (!$ComputerName){
			$path = 'C:\Users\'+$username+'\appdata\local\google\chrome\user data\default\extensions\'+$extension_id+'\'+$version
		}
		else {
			$path = '\\'+$ComputerName+'\c$\Users\'+$username+'\appdata\local\google\chrome\user data\default\extensions\'+$extension_id+'\'+$version
		}
		$manifests = get-childitem -path ($path+'*\manifest.json')
		$info = $manifests | %{
			$p = $_.fullname
			$mm = Get-Content $_ | convertfrom-json | select name,description,default_locale,version,@{n='path';e={$p}}
			if ($mm.name -like '__MSG_*'){
				$searchstring = $mm.name -replace '__MSG_' -replace '_+$' 
				$locale = $mm.default_locale
				$lp = $p -replace '\\manifest\.json',('\_locales\'+$locale+'\messages.json')
				$nn = Get-Content -path $lp | convertfrom-json
				$mm.name = $nn.$searchstring.message
			}
			if ($mm.description -like '__MSG_*'){
				$searchstring = $mm.description -replace '__MSG_' -replace '_+$' 
				$locale = $mm.default_locale
				$lp = $p -replace '\\manifest\.json',('\_locales\'+$locale+'\messages.json')
				$nn = Get-Content -path $lp | convertfrom-json
				$mm.description = $nn.$searchstring.message
			}
			$mm
		}
		$info = $info | select name,description,version,@{n='extension_id';e={($_.path -replace '.*appdata\\local\\google\\chrome\\user data\\default\\extensions\\' -replace '\\.*$')}},path | sort name
		Return $info
	}
	if (!$username){
		$username = '*'
	}
	if (!$ComputerName){
		$path = 'C:\Users\'+$username+'\appdata\local\google\chrome\user data\default\extensions\*'
	}
	else {
		$path = '\\'+$ComputerName+'\c$\Users\'+$username+'\appdata\local\google\chrome\user data\default\extensions\*'
	}
	$extensions = get-childitem -Path $path | Select @{n='extension_id';e={$_.name}},@{n='username';e={$_.fullname -replace '\\appdata.*' -replace '.*\\Users\\'}}
	$extensioninfo = @()
	$extensions | %{
		$u = $_.username
		$extensioninfo += Get-ChromeExtensionLocalManifest -extension_id $_.'extension_id' -username $_.username -computername $computername | select name,description,version,extension_id,@{n='username';e={$u}},path
		}
	Return $extensioninfo
}
