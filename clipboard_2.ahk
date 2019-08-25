#persistent

OnError("LogError")

Gui MyGui:Add, Text, vMyEdit h800 w400.
Gui MyGui:Show, w400 h800, Mein Fenster

GuiControl MyGui:Text, MyEdit, TEST

global Active := 				[0,1]
global ImBarb := 				[0,2]
global ImMonk := 				[0,3]
global ImWizard := 				[0,4]
global ImNecro := 				[0,5]
global ImDh := 					[0,6]
global ImSader := 				[0,7]

global ConventionLight := 		[1,1]
global ConventionArcane := 		[1,2]
global ConventionCold := 		[1,3]
global ConventionFire := 		[1,4]
global BlackholeBuffActive := 	[1,5]
global CastArcaneBlast := 		[1,6]

global InARift := 				[2,1]
global DontCastLand := 			[2,2]
global CastBlindingFlash := 	[2,3]
global CastCommandSkeletons := 	[2,4]

global CastIp := 				[3,1]
global CastSim := 				[3,2]
global DontCastSim := 			[3,3]
global CastFalter := 			[3,4]
global CastBerserker := 		[3,5]
global CastSprint := 			[3,6]
global CastEpiphany := 			[3,7]

global CastWc := 				[4,1]
global CastMantraHealing := 	[4,2]
global CastSweepingWind := 		[4,3]
global CastBoh := 				[4,4]
global CastMantraConviction := 	[4,5]
global CastLotd := 				[4,6]
global CastBoneArmor := 		[4,7]

global CastPotion := 			[5,1]
global CastStormArmor := 		[5,2]
global CastMagicWeapon := 		[5,3]
global CastVengeance := 		[5,4]
global CastRainOfVengeance := 	[5,5]
global CastPreparation := 		[5,6]
global CastSkeleMages := 		[5,7]

global ForceMove := 			[6,1]
global BandOfMightBuffActive := [6,2]
global fullDynamoStacks := 		[6,3]
global CastExplosiveBlast := 	[6,4]


global turboDataArray := [	[0,0,0,0,0,0,0,0]
						,	[0,0,0,0,0,0,0,0]
						,	[0,0,0,0,0,0,0,0]
						,	[0,0,0,0,0,0,0,0]
						,	[0,0,0,0,0,0,0,0]
						,	[0,0,0,0,0,0,0,0]
						,	[0,0,0,0,0,0,0,0]
						,	[0,0,0,0,0,0,0,0]]	


global wizInAction = 0

identifyer = TURBODATA_

; Main Loop
loop
{
	sleep 50
	; Text from Clipboard
	clipboard := ""
	
	ClipWait
	if ErrorLevel
	{
		MsgBox FEHLER1
		continue
	}
	
	try {
		MyClipboard := clipboard
	} catch e {
		MsgBox FEHLER2
		continue
	}
	
	; Daten sind gleich geblieben ?
	;if(MyClipboard == oldData)
	;continue 
	
	; Nicht unsere Daten ?
	IfNotInString, MyClipboard, %identifyer% 
	continue
	
	; Daten haben nicht die richtige Form ?
	if(StrLen(StrReplace(MyClipboard, identifyer)) != 64) 
	continue
	
	oldData := MyClipboard
	
	; Mach was mit den Daten
	MyData := StrReplace(MyClipboard, identifyer)
	Loop, Parse, MyData
	turboDataArray[Floor(A_Index / 8), Mod(A_Index,8) - 1] := A_LoopField
	
	;debugPrint()
	doActionWiz2()
}


doActionWiz2() {
	
	if(getData(ImWizard) != 1) {
		return
	}
	if(getData(CastPotion) == 1) {
		Send {f}
	}
	if(wizInAction == 1) {
		return
	}
	if(getData(CastStormArmor) == 1) {
		Send {e}
	}
	if(getData(CastMagicWeapon) == 1) {
		Send {w}
	}
	if(getData(CastExplosiveBlast) == 1) {
		Send {q}
	}
}

getData(pointer) {
	return turboDataArray[pointer[1],pointer[2]]
}

debugPrint() {
	text2Display := 
	(
		"Active: " . getData(Active ) . "`n" . "ImBarb: " . getData(ImBarb ) . "`n" . "ImMonk: " . getData(ImMonk ) . "`n" . "ImWizard: " . getData(ImWizard ) . "`n" . "ImNecro: " . getData(ImNecro ) . "`n" . "ImDh: "  . getData(ImDh ) . "`n" . "ImSader: " . getData(ImSader ) . "`n" . "ConventionLight: " . getData(ConventionLight ) . "`n" . "ConventionArcane: " . getData(ConventionArcane ) . "`n" . "ConventionCold: " . getData(ConventionCold ) . "`n" . "ConventionFire: " . getData(ConventionFire ) . "`n" . "BlackholeBuffActive: " . getData(BlackholeBuffActive ) . "`n" . "CastArcaneBlast: " . getData(CastArcaneBlast ) . "`n" . "InARift: " . getData(InARift ) . "`n" . "DontCastLand: " . getData(DontCastLand ) . "`n" . "CastBlindingFlash: " . getData(CastBlindingFlash ) . "`n" . "CastCommandSkeletons: " . getData(CastCommandSkeletons ) . "`n" . "CastIp: " . getData(CastIp ) . "`n" . "CastSim: " . getData(CastSim ) . "`n" . "DontCastSim: " . getData(DontCastSim ) . "`n" . "CastFalter: " . getData(CastFalter ) . "`n" . "CastBerserker: " . getData(CastBerserker ) . "`n" . "CastSprint: " . getData(CastSprint ) . "`n" . "CastEpiphany: " . getData(CastEpiphany ) . "`n" . "CastWc: " . getData(CastWc ) . "`n" . "CastMantraHealing: " . getData(CastMantraHealing ) . "`n" . "CastSweepingWind: " . getData(CastSweepingWind ) . "`n" . "CastBoh: " . getData(CastBoh ) . "`n" . "CastMantraConviction: " . getData(CastMantraConviction ) . "`n" . "CastLotd: " . getData(CastLotd ) . "`n" . "CastBoneArmor: " . getData(CastBoneArmor ) . "`n" . "CastPotion: " . getData(CastPotion ) . "`n" . "CastStormArmor: " . getData(CastStormArmor ) . "`n" . "CastMagicWeapon: " . getData(CastMagicWeapon ) . "`n" . "CastVengeance: " . getData(CastVengeance ) . "`n" . "CastRainOfVengeance: " . getData(CastRainOfVengeance ) . "`n" . "CastPreparation: " . getData(CastPreparation ) . "`n" . "CastSkeleMages: " . getData(CastSkeleMages ) . "`n" . "ForceMove: " . getData(ForceMove ) . "`n" . "BandOfMightBuffActive: " . getData(BandOfMightBuffActive ) . "`n" . "fullDynamoStacks: "getData(fullDynamoStacks) . "`n" . "CastExplosiveBlast: "getData(CastExplosiveBlast) . "`n"
	)
	GuiControl MyGui:Text, MyEdit, % text2Display
}

LogError(exception) {
    FileAppend % "Error on line " exception.Line ": " exception.Message "`n"
        , errorlog.txt
    return true
}

MsgBox DONE!
