//	IRMouseView.j
//	Evadne Wu at Iridia, 2010

@import <IRDelegation/IRDelegation.j>
	
	
	
	
	
@implementation IRMouseView : CPView {
	
	id _delegate @accessors(property=delegate);

}





+ (IRProtocol) irDelegateProtocol {

	return [IRProtocol protocolWithSelectorsAndOptionalFlags:

		@selector(mouseView:didReceiveMouseDownEvent:), true,
		@selector(mouseView:didReceiveMouseDragEvent:), true,
		@selector(mouseView:didReceiveMouseUpEvent:), true,
		@selector(mouseView:didReceiveScrollWheelEvent:), true

	];
	
}





- (void) mouseDown:(CPEvent)event {
	
	if ([[self delegate] respondsToSelector:@selector(mouseView:didReceiveMouseDownEvent:)])
	[[self delegate] mouseView:self didReceiveMouseDownEvent:event];
	
}





- (void) mouseDragged:(CPEvent)event {
		
	if ([[self delegate] respondsToSelector:@selector(mouseView:didReceiveMouseDragEvent:)])
	[[self delegate] mouseView:self didReceiveMouseDragEvent:event];
	
}





- (void) mouseUp:(CPEvent)event {
	
	if ([[self delegate] respondsToSelector:@selector(mouseView:didReceiveMouseUpEvent:)])
	[[self delegate] mouseView:self didReceiveMouseUpEvent:event];
	
}





- (void)scrollWheel:(CPEvent)event {
	
	if ([[self delegate] respondsToSelector:@selector(mouseView:didReceiveScrollWheelEvent:)])
	[[self delegate] mouseView:self didReceiveScrollWheelEvent:event];
		
}











@end