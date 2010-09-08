//	IRMouseView.j
//	Evadne Wu at Iridia, 2010

@import <IRDelegation/IRDelegation.j>
	
	
	
	
	
@implementation IRMouseView : CPView {
	
	id _delegate @accessors(property=delegate);

}





+ (IRProtocol) irDelegateProtocol {

	return [IRProtocol protocolWithSelectorsAndOptionalFlags:

		@selector(mouseView:didReceiveMouseDownEvent:), true

	];
	
}





- (void) mouseDown:(CPEvent)event {
	
	CPLog(@"Received mousedown event on self");
	
	if ([[self delegate] respondsToSelector:@selector(mouseView:didReceiveMouseDownEvent:)])
	[[self delegate] mouseView:self didReceiveMouseDownEvent:event];
	
}











@end