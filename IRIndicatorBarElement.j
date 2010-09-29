//	IRIndicatorBarElement.j
//	Evadne Wu at Iridia, 2010

@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import "CPView+IRInterfaceKitAdditions.j"
@import "IRStyledView.j"
	
	
	
	
	
@implementation IRIndicatorBarElement : IRStyledView {
	
	BOOL active;
	CPTextField label;
	
}

- (IRBeigeBox) initWithFrame:(CGRect)aFrame title:(CPString)title {

	self = [super initWithFrame:aFrame]; if (self == nil) return nil;
	
	[backgroundView setBackgroundNinePartPatternImageNamed:@"IRIndicatorBar.backdrop" sliceTop:16 right:32 bottom:16 left:32 sender:self];
	
	[backgroundView setFrame:CGRectOffset(CGRectMake(0, 0, aFrame.size.width, aFrame.size.height), CGRectOffsetMake(16, 16, 16, 16))];
	
	[backgroundView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	
	label = [CPTextField labelWithTitle:title];
	[contentView addSubview:label];
	[label setValue:[[CPFont boldSystemFontOfSize:13.0] cssString] forThemeAttribute:@"font"];
	[label setValue:[CPColor colorWithWhite:0.25 alpha:1.0] forThemeAttribute:@"text-color"];
	[label setValue:[CPColor colorWithWhite:1 alpha:1.0] forThemeAttribute:@"text-color" inState:CPThemeStateHighlighted];
	
	
	[label sizeToFit];
	[label centerInSuperview];
	
	active = NO;
			
	return self;
	
}

- (void) setActive:(BOOL)flag {
	
	CPLog(@"label is %@", label);
	
	if (flag) {
		
		[backgroundView setBackgroundNinePartPatternImageNamed:@"IRIndicatorBar.backdrop.active" sliceTop:16 right:32 bottom:16 left:32 sender:self];
		
		[label setThemeState:CPThemeStateHighlighted];
		
	} else {
		
		[backgroundView setBackgroundNinePartPatternImageNamed:@"IRIndicatorBar.backdrop" sliceTop:16 right:32 bottom:16 left:32 sender:self];
		
		[label unsetThemeState:CPThemeStateHighlighted];
		
	}
	
}

- (BOOL) isActive {
	
	return active;
	
}











@end