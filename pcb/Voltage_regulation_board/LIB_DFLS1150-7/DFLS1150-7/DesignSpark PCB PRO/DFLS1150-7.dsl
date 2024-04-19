SamacSys ECAD Model
440946/1264715/2.50/2/4/Schottky Diode

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r127_110"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.1) (shapeHeight 1.27))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "SODFL3718X100N" (originalName "SODFL3718X100N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r127_110) (pt -1.6, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r127_110) (pt 1.6, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -2.3 1.115) (pt 2.3 1.115) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 2.3 1.115) (pt 2.3 -1.115) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 2.3 -1.115) (pt -2.3 -1.115) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -2.3 -1.115) (pt -2.3 1.115) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.4 0.89) (pt 1.4 0.89) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.4 0.89) (pt 1.4 -0.89) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1.4 -0.89) (pt -1.4 -0.89) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.4 -0.89) (pt -1.4 0.89) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.4 0.34) (pt -0.85 0.89) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.15 0.89) (pt 1.4 0.89) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.4 -0.89) (pt 1.4 -0.89) (width 0.2))
		)
	)
	(symbolDef "DFLS1150-7" (originalName "DFLS1150-7")

		(pin (pinNum 1) (pt 100 mils 0 mils) (rotation 0) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 240 mils -15 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 700 mils 0 mils) (rotation 180) (pinLength 100 mils) (pinDisplay (dispPinName false)) (pinName (text (pt 560 mils -15 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(line (pt 300 mils 100 mils) (pt 300 mils -100 mils) (width 6 mils))
		(line (pt 300 mils 100 mils) (pt 340 mils 100 mils) (width 6 mils))
		(line (pt 340 mils 100 mils) (pt 340 mils 60 mils) (width 6 mils))
		(line (pt 300 mils -100 mils) (pt 260 mils -100 mils) (width 6 mils))
		(line (pt 260 mils -100 mils) (pt 260 mils -60 mils) (width 6 mils))
		(line (pt 200 mils 0 mils) (pt 300 mils 0 mils) (width 6 mils))
		(line (pt 500 mils 0 mils) (pt 600 mils 0 mils) (width 6 mils))
		(poly (pt 300 mils 0 mils) (pt 500 mils 100 mils) (pt 500 mils -100 mils) (pt 300 mils 0 mils) (width 10  mils))
		(attr "RefDes" "RefDes" (pt 500 mils 350 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "DFLS1150-7" (originalName "DFLS1150-7") (compHeader (numPins 2) (numParts 1) (refDesPrefix D)
		)
		(compPin "1" (pinName "K") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "A") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "DFLS1150-7"))
		(attachedPattern (patternNum 1) (patternName "SODFL3718X100N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Mouser Part Number" "621-DFLS1150-7")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Diodes-Incorporated/DFLS1150-7?qs=mQbszxtPdlOd7jzC8V7k8A%3D%3D")
		(attr "Manufacturer_Name" "Diodes Incorporated")
		(attr "Manufacturer_Part_Number" "DFLS1150-7")
		(attr "Description" "Diodes Inc DFLS1150-7, SMT Schottky Diode, 150V 1A, 2-Pin PowerDI 123")
		(attr "Datasheet Link" "https://www.diodes.com/assets/Datasheets/ds30593.pdf")
		(attr "Height" "1 mm")
	)

)
