//	IRActionSheetController.j
	
	
	
	
	
@implementation IRActionSheetController : CPWindowController {
	
	CPView headerView;
	CPView contentView;
	CPView footerView;
	CPView backdropView;
	
}

- (void) loadWindow {
	
	if (_window) return;
	
	_window = [[CPWindow alloc] initWithContentRect:CGRectMake(0, 0, 384, 384) styleMask:CPDocModalWindowMask];	
	[_window._windowView setClipsToBounds:NO]
	
	[_window._windowView setBackgroundColor:[CPColor redColor]];

	backdropView = [[IRBeigeBox alloc] initWithFrame:CGRectMake(0, 0, 384, 384)];
	[[_window contentView] addSubview:backdropView];
	[backdropView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[[_window contentView] setClipsToBounds:NO];
	[[_window contentView] setAutoresizesSubviews:YES];
	
	contentView = [[CPView alloc] initWithFrame:CGRectMake(0, 0, 384, 384)];
	[contentView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[[_window contentView] addSubview:contentView];

	[_window setHasShadow:NO];

}





- (float) optimumWidth {
	
	var returnValue = 0;
//	if (contentView != nil) return CGRectGetWidth([contentView frame]);	//, returnValue);
	
	if (headerView != nil) returnValue = MAX(CGRectGetWidth([headerView frame]), returnValue);
	if (contentView != nil) returnValue = MAX(CGRectGetWidth([contentView frame]), returnValue);
	if (footerView != nil) returnValue = MAX(CGRectGetWidth([footerView frame]), returnValue);
	
	return returnValue;
	
}

- (void) setHeaderView:(CPView)inHeaderView {
	
	if (inHeaderView == nil) return;
	
	[inHeaderView setAutoresizesSubviews:YES];
	
	[headerView removeFromSuperview];
	headerView = inHeaderView;
	[[_window contentView] addSubview:headerView];
	[self layoutSubviews];
	
}

- (CPView) headerView {
	
	return headerView;
	
}

- (void) setFooterView:(CPView)inFooterView {
	
	if (inFooterView == nil) return;
	
	[footerView removeFromSuperview];
	footerView = inFooterView;
	[[_window contentView] addSubview:footerView];
	[self layoutSubviews];
	
}

- (void) footerView {
	
	return footerView;
	
}

- (void) setContentView:(CPView)inContentView {
	
	CPLog(@"called setContentView");
	
	if (inContentView == nil) return;
	
	[contentView removeFromSuperview];
	contentView = inContentView;
	[[_window contentView] addSubview:contentView];
	[self layoutSubviews];
	
}

- (void) contentView {
	
	return contentView;
	
}





- (void) layoutSubviews {
	
	if (headerView == nil) return;

	var headerViewHeight = (headerView == nil) ? 0 : CGRectGetHeight([headerView frame]);
	var contentViewHeight = (contentView == nil) ? 0 : CGRectGetHeight([contentView frame]);
	var footerViewHeight = (footerView == nil) ? 0 : CGRectGetHeight([footerView frame]);
	
	CPLog(@"header %f, content %f, footer %f", headerViewHeight, contentViewHeight, footerViewHeight);
	
	var optimumWidth = [self optimumWidth];
	CPLog(@"optimumWidth is %f", optimumWidth);
	
	if (headerView != nil)
	[headerView setFrame:CGRectMake(0, 0, optimumWidth, headerViewHeight)];
	
	if (contentView != nil)	
	[contentView setFrame:CGRectMake(0, headerViewHeight, optimumWidth, contentViewHeight)];
	
	if (footerView != nil)
	[footerView setFrame:CGRectMake(0, headerViewHeight + contentViewHeight, optimumWidth, footerViewHeight)];
	
	var oldFrame = [_window frame];
	var newFrame = CGRectMake(0, 0, optimumWidth, headerViewHeight + contentViewHeight + footerViewHeight);
	
	CGRectDump(oldFrame, @"old frame");
	CGRectDump(newFrame, @"new frame");
	
	var finalFrame = CGAlignedRectMake(newFrame, kCGAlignmentPointRefTop, oldFrame, kCGAlignmentPointRefTop);

	[_window setFrame:finalFrame];
	[[_window contentView] setFrame:CGRectMake(0, 0, optimumWidth, headerViewHeight + contentViewHeight + footerViewHeight)];

}

@end




