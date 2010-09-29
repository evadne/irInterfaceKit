//	IREmperorBox.j
	
@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import "CPView+IRInterfaceKitAdditions.j"
@import "IRStyledView.j"





@implementation IREmperorBox : IRStyledView {



}





- (IREmperorBox) initWithFrame:(CGRect)aFrame {

	self = [super initWithFrame:aFrame]; if (self == nil) return nil;

	[backgroundView setBackgroundNinePartPatternImageNamed:@"IREmperorBox.backdrop" sliceTop:0 right:32 bottom:0 left:32 sender:self];
	
	[backgroundView setAutoresizingMask:CPViewWidthSizable];

	[backgroundView setFrame:CGRectOffset(CGRectMake(0, 0, aFrame.size.width, aFrame.size.height), CGRectOffsetMake(0, 0, 32, 0))];

	[self setClipsToBounds:NO];

	return self;

}





@end