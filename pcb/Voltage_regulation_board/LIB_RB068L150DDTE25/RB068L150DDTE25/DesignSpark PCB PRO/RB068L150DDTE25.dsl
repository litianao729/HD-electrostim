SamacSys ECAD Model
15287838/1264715/2.50/2/2/Schottky Diode

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r225_160"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.6) (shapeHeight 2.25))
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
	(patternDef "DIOM5026X220N" (originalName "DIOM5026X220N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r225_160) (pt -2, 0) (rotation 90))
			(pad (padNum 2) (padStyleRef r225_160) (pt 2, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -3.375 1.65) (pt 3.375 1.65) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 3.375 1.65) (pt 3.375 -1.65) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 3.375 -1.65) (pt -3.375 -1.65) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -3.375 -1.65) (pt -3.375 1.65) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.5 1.3) (pt 2.5 1.3) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.5 1.3) (pt 2.5 -1.3) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 2.5 -1.3) (pt -2.5 -1.3) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.5 -1.3) (pt -2.5 1.3) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -2.5 0.5) (pt -1.7 1.3) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 2.5 1.3) (pt -2.8 1.3) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -2.5 -1.3) (pt 2.5 -1.3) (width 0.2))
		)
	)
	(symbolDef "RB068L150DDTE25" (originalName "RB068L150DDTE25")

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
	(compDef "RB068L150DDTE25" (originalName "RB068L150DDTE25") (compHeader (numPins 2) (numParts 1) (refDesPrefix D)
		)
		(compPin "1" (pinName "K") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "A") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "RB068L150DDTE25"))
		(attachedPattern (patternNum 1) (patternName "DIOM5026X220N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Mouser Part Number" "755-RB068L150DDTE25")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/ROHM-Semiconductor/RB068L150DDTE25?qs=HXFqYaX1Q2wo%2F7dyRQhxHg%3D%3D")
		(attr "Manufacturer_Name" "ROHM Semiconductor")
		(attr "Manufacturer_Part_Number" "RB068L150DDTE25")
		(attr "Description" "ROHM 150V 2A, Rectifier & Schottky Diode, 2-Pin DO-214AC RB068L150DDTE25")
		(attr "Datasheet Link" "https://fscdn.rohm.com/en/products/databook/datasheet/discrete/diode/schottky_barrier/rb068l150ddte25-e.pdf")
		(attr "Height" "2.2 mm")
	)

)