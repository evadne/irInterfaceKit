//	IRCautionBox.j
//	Evadne Wu at Iridia, 2010

@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import "CPView+IRInterfaceKitAdditions.j"
@import "IRStyledView.j"
	
	
	
	
	
@implementation IRCautionBox : IRStyledView {
	
	
	
}

- (IRBeigeBox) initWithFrame:(CGRect)aFrame {

	self = [super initWithFrame:aFrame]; if (self == nil) return nil;
	
	var fullFrame = CGRectMake(0, 0, aFrame.size.width, aFrame.size.height);
	
	var backgroundBaseView = [[CPView alloc] init];
	[backgroundView addSubview:backgroundBaseView];
	[backgroundBaseView setBackgroundNinePartPatternImageNamed:@"IRCautionBox.backdrop.base" sliceTop:20 right:20 bottom:20 left:20 sender:self];
	[backgroundBaseView setFrame:CGRectOffset(fullFrame, CGRectOffsetMake(16, 16, 16, 16))];
	[backgroundBaseView setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin | CPViewMaxXMargin | CPViewMaxYMargin | CPViewWidthSizable | CPViewHeightSizable];
	
	var backgroundPatternView = [[CPView alloc] init];
	[backgroundView addSubview:backgroundPatternView];
	[backgroundPatternView setFrame:fullFrame];
	[backgroundPatternView setBackgroundPatternImageNamed:@"IRCautionBox.backdrop.stripes" sender:self];
	[backgroundPatternView setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin | CPViewMaxXMargin | CPViewMaxYMargin | CPViewWidthSizable | CPViewHeightSizable];
	
	var backgroundOverlayView = [[CPView alloc] init];
	[backgroundView addSubview:backgroundOverlayView];
	[backgroundOverlayView setBackgroundNinePartPatternImageNamed:@"IRCautionBox.backdrop.overlay" sliceTop:20 right:20 bottom:20 left:20 sender:self];
	[backgroundOverlayView setFrame:CGRectOffset(fullFrame, CGRectOffsetMake(12, 12, 12, 12))];
	[backgroundOverlayView setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin | CPViewMaxXMargin | CPViewMaxYMargin | CPViewWidthSizable | CPViewHeightSizable];
	
	[backgroundView setClipsToBounds:NO];
			
	return self;
	
}





@end