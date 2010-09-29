//	IRDarkSunkenView.j
//	Evadne Wu at Iridia, 2010

@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import "CPView+IRInterfaceKitAdditions.j"
@import "IRStyledView.j"





@implementation IRDarkSunkenView : IRStyledView {



}

- (IRBeigeBox) initWithFrame:(CGRect)aFrame {

	self = [super initWithFrame:aFrame]; if (self == nil) return nil;

	[backgroundView setBackgroundNinePartPatternImageNamed:@"IRDarkSunkenView.backdrop" sliceTop:20 right:20 bottom:20 left:20 sender:self];

	[backgroundView setFrame:CGRectOffset(CGRectMake(0, 0, aFrame.size.width, aFrame.size.height), CGRectOffsetMake(16, 16, 16, 16))];

	[backgroundView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];

	return self;

}





@end