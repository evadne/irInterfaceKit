//	CPView+IRInterfaceKitAdditions.j
//	Evadne Wu at Iridia, 2010





@import <AppKit/CPView.j>





@implementation CPView (IRInterfaceKitAdditions)





- (void) setBackgroundPatternImageNamed:(CPString)backgroundPatternImageName {
	
	[self setBackgroundPatternImageNamed:backgroundPatternImageName sender:self];
	
}





- (void) setBackgroundPatternImageNamed:(CPString)backgroundPatternImageName sender:(id)sender {
	
	[self setBackgroundColor:
	
		[CPColor colorWithPatternImage:
		
			[[CPImage alloc] initWithContentsOfFile:
			
				[[CPBundle bundleForClass:[sender class]] pathForResource:backgroundPatternImageName + @".png"]
	
			]
		
		]
		
	];
	
}





- (void) setBackgroundNinePartPatternImageNamed:(CPString)backgroundPatternImageName sliceTop:(float)topSliceWidth right:(float)rightSliceWidth bottom:(float)bottomSliceWidth left:(float)leftSliceWidth {
	
	[self setBackgroundNinePartPatternImageNamed:backgroundPatternImageName sliceTop:topSliceWidth right:rightSliceWidth bottom:bottomSliceWidth left:leftSliceWidth sender:self];
	
}





- (void) setBackgroundNinePartPatternImageNamed:(CPString)backgroundPatternImageName sliceTop:(float)topSliceWidth right:(float)rightSliceWidth bottom:(float)bottomSliceWidth left:(float)leftSliceWidth sender:(id)sender {
	
	var image = function (index) {
		
		return [[CPBundle bundleForClass:[sender class]] pathForResource:backgroundPatternImageName + @"_0" + index + @".png"];
		
	}
	
//	Photoshop conventions
	
	[self setBackgroundColor:[CPColor colorWithPatternImage:[[CPNinePartImage alloc] initWithImageSlices:[

		[[CPImage alloc] initWithContentsOfFile:image("1") size:CGSizeMake(leftSliceWidth, topSliceWidth)],
		[[CPImage alloc] initWithContentsOfFile:image("2") size:CGSizeMake(1.0, topSliceWidth)],
		[[CPImage alloc] initWithContentsOfFile:image("3") size:CGSizeMake(rightSliceWidth, topSliceWidth)],

		[[CPImage alloc] initWithContentsOfFile:image("4") size:CGSizeMake(leftSliceWidth, 1.0)],
		[[CPImage alloc] initWithContentsOfFile:image("5") size:CGSizeMake(1.0, 1.0)],
		[[CPImage alloc] initWithContentsOfFile:image("6") size:CGSizeMake(rightSliceWidth, 1.0)],

		[[CPImage alloc] initWithContentsOfFile:image("7") size:CGSizeMake(leftSliceWidth, bottomSliceWidth)],
		[[CPImage alloc] initWithContentsOfFile:image("8") size:CGSizeMake(1.0, bottomSliceWidth)],
		[[CPImage alloc] initWithContentsOfFile:image("9") size:CGSizeMake(rightSliceWidth, bottomSliceWidth)]
			
	]]]];
	
}





@end




