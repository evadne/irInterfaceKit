//	IRBeigeBox.j
//	Evadne Wu at Iridia, 2010

@import <CGGeometry+IRAdditions/CGGeometry+IRAdditions.j>
@import "CPView+IRInterfaceKitAdditions.j"
@import "IRStyledView.j"
	
	
	
	
	
@implementation IRBeigeBox : IRStyledView {
	
	
	
}

- (CGRectOffset) visualBoundsOffset {

	return CGRectOffsetMake(32, 32, 32, 32);

}

- (IRBeigeBox) initWithFrame:(CGRect)aFrame {

	self = [super initWithFrame:aFrame]; if (self == nil) return nil;
	
	[backgroundView setBackgroundNinePartPatternImageNamed:@"IRBeigeBox.backdrop" sliceTop:48 right:48 bottom:48 left:48 sender:self];
		
	return self;
	
}





@end