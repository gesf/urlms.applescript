(*
urlms.scpt: 
Application to short URLs using urlms.com service API.
Use Mac OSX built in cURL to make the API call.
*)

set TheURL to "http://"

-- Ask user for the URL
display dialog "Enter URL to shorten:" default answer TheURL

-- Stores the given URL
set TheURL to the text returned of the result

if (TheURL = "http://") then
	display dialog "No URL given." & return & "Exiting from script!" buttons "OK" default button 1 with icon caution
	return
end if

-- Run shell command
set TheResult to do shell script "curl http://api.urlms.com/ -d 'result=plain&url=" & TheURL & "'"
set ShortenURL to "http://urlms.com/" & TheResult

-- Show returned headers
set TheButton to (display dialog "Your shorten URL is: " & ShortenURL buttons {"View page", "Close"})

-- Go to URL
if button returned of TheButton = "View page" then
	open location ShortenURL
end if
