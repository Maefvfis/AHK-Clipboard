identifyer = TURBODATA_

; Main Loop
loop
{
	sleep 50
	; Text from Clipboard
	try {
		MyClipboard := clipboard
	} catch e {
		MsgBox error
		continue
	}
	
	; Check if this is the data we want
	IfNotInString, MyClipboard, %identifyer% 
	continue
	
	if(StrLen(StrReplace(MyClipboard, identifyer)) != 64) 
	continue
	
	; Do something else with that data

}
