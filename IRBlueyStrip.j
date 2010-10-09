//	IRBlueyStrip.j
//	Evadne Wu at Iridia, 2010
	
@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import "CPView+IRInterfaceKitAdditions.j"
@import "IRStyledView.j"
@import "IRButtonBar.j"





@implementation IRBlueyStrip : IRButtonBar {



}





- (IRBlueyStrip) initWithFrame:(CGRect)aFrame {

	self = [super initWithFrame:aFrame]; if (self == nil) return nil;

	[backgroundView setBackgroundNinePartPatternImageNamed:@"IRBlueyStrip.backdrop" sliceTop:8 right:8 bottom:8 left:8 sender:self];
	
	[backgroundView setAutoresizingMask:CPViewWidthSizable];

	[backgroundView setFrame:CGRectOffset(CGRectMake(0, 0, aFrame.size.width, aFrame.size.height), CGRectOffsetMake(12, 12, 12, 12))];

	[self setClipsToBounds:NO];

	return self;

}





@end