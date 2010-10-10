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
	
	[self setBackgroundColor:[CPColor colorWithPatternImage:[CPNinePartImage imageWithBaseName:backgroundPatternImageName inBundle:[CPBundle bundleForClass:[sender class]] withInset:CGInsetMake(topSliceWidth, rightSliceWidth, bottomSliceWidth, leftSliceWidth)]]];
	
}





- (CGRectOffset) visualBoundsOffset {
	
//	Override point for offset’d backdropped views.  A negative value in the offset means centrifugal.
//	i.e., a positive top offset means the final top border is higher than the previous border.	
	
	return CGRectOffsetZero();
	
}

- (CGRect) visualFrame {
	
	var returnFrame = CGRectMake(
	
		[self frame].origin.x + [self visualBoundsOffset].topOffset,
		[self frame].origin.y + [self visualBoundsOffset].leftOffset,	
		[contentView frame].size.width,
		[contentView frame].size.height
		
	);
	
	return returnFrame;
	
}

- (void) setVisualFrame:(CGRect)frame {

	[self setFrame:[self actualFrameForVisualFrame:frame]];
	
}

- (CPView) initWithVisualFrame:(CGRect)frame {
	
	self = [self initWithFrame:frame]; if (self == nil) return;
	[self setVisualFrame:frame];
	return self;
	
}

- (CGRect) actualFrameForVisualFrame:(CGRect)frame {
	
	return CGRectOffset(frame, [self visualBoundsOffset]);
	
}




- (void) centerHorizontallyInSuperview {
	
	if ([self superview] == nil) return;
	
	[self setCenter:CGPointMake(
		
		[[self superview] frame].size.width / 2,
		[self center].y
		
	)];
	
}





- (void) centerVerticallyInSuperview {
	
	if ([self superview] == nil) return;
	
	[self setCenter:CGPointMake(
		
		[self center].x,
		[[self superview] frame].size.height / 2
		
	)];
	
}





- (void) centerInSuperview {
	
	if ([self superview] == nil) return;
	
	[self setCenter:CGPointMake(
		
		[[self superview] frame].size.width / 2,
		[[self superview] frame].size.height / 2
		
	)];
	
}





- (void) animateUsingEffect:(CPViewAnimationKey)inAnimationEffectKey duration:(CPTimeInterval)inDuration curve:(CPAnimationCurve)inCurve delegate:(id)inDelegate {
	
	var animation = [[CPViewAnimation alloc] initWithViewAnimations:[

		[CPDictionary dictionaryWithObjectsAndKeys:

 			self, CPViewAnimationTargetKey, 
 			inAnimationEffectKey, CPViewAnimationEffectKey

 		]

 	]];	

	[animation setDuration:inDuration];
	[animation setDelegate:inDelegate];
	[animation setAnimationCurve:inCurve];
	[animation startAnimation];
	
}





@end




