//	IRGenericBar.backdrop
	
@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import "CPView+IRInterfaceKitAdditions.j"
@import "IRStyledView.j"





@implementation IRGenericBar : IRStyledView {



}





- (IRGenericBar) initWithFrame:(CGRect)aFrame {

	self = [super initWithFrame:aFrame]; if (self == nil) return nil;

	[backgroundView setBackgroundPatternImageNamed:@"IRGenericBar.backdrop" sender:self];
	[backgroundView setFrame:CGRectOffset(CGRectMake(0, 0, aFrame.size.width, aFrame.size.height), CGRectOffsetMake(16, 0, 16, 0))];

	[backgroundView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];

	return self;

}





@end