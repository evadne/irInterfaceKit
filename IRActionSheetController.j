//	IRActionSheetController.j
	
	
	
	

@implementation CPResponder (Test)

- (void)mouseDown:(CPEvent)anEvent
{

CPLog(@"mouseDown called on %@.  Not handled.  Forwarding to %@.", self, [self nextResponder]);
    [_nextResponder performSelector:_cmd withObject:anEvent];
}

@end
@implementation IRActionSheetController : CPWindowController {
	
//	The backdropView provides the boxy backdrop
	CPView backdropView;	

	CPView wrapperView;
	
	CPView headerView;
	CPView footerView;

	CPScrollView contentWrapperView;
	CPView contentView;
	
	id representedObject @accessors;
	
}

- (void) loadWindow {
	
	if (_window) return;
	
	[self setWindow:[[CPWindow alloc] initWithContentRect:CGRectMake(0, 0, 512, 512) styleMask:CPDocModalWindowMask]];
	[[self window] setContentView:[[IRActionSheetLayoutView alloc] initWithFrame:CGRectMakeZero()]];
	[[self window] setHasShadow:NO];
	[[self window]._windowView setClipsToBounds:NO];
	
	
	backdropView = [[IRBeigeBox alloc] initWithFrame:CGRectMake(0, -32, 512, 512 + 32)];
	[[[self window] contentView] addSubview:backdropView];
	
		[backdropView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
		[[_window contentView] setClipsToBounds:NO];
		[[_window contentView] setAutoresizesSubviews:YES];
	
	
//	Wrapper
	
	// contentWrapperBaseView = [[IRRecessedInnerShadowedView alloc] initWithFrame:CGRectMake(0, 0, 512, 512)];
	// [contentWrapperBaseView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	// [[[self window] contentView] setContentView:contentWrapperBaseView];
	
//	contentWrapperView = [[IRSkinnyScrollView alloc] initWithFrame:CGRectMake(0, 0, 512, 512)];
//	[contentWrapperBaseView addSubview:contentWrapperView positioned:CPWindowBelow relativeTo:nil];
	
	contentWrapperView = [[IRSkinnyScrollView alloc] initWithFrame:CGRectMake(0, 0, 512, 512)];
	[contentWrapperView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[[[self window] contentView] setContentView:contentWrapperView];
	[contentWrapperView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];

		[contentWrapperView setHasHorizontalScroller:YES];
		[contentWrapperView setHasVerticalScroller:YES];
		[contentWrapperView setAutohidesScrollers:NO];
		[contentWrapperView setInvertedColor:NO];

}





- (void) setHeaderView:(CPView)inHeaderView {

	[inHeaderView setAutoresizingMask:CPViewWidthSizable|CPViewMaxYMargin];
	[[[self window] contentView] setHeaderView:inHeaderView];
	
	headerView = inHeaderView;

}

- (CPView) headerView {
	
	return headerView;
	
}

- (void) setFooterView:(CPView)inFooterView {
	
	[inFooterView setAutoresizingMask:CPViewWidthSizable|CPViewMinYMargin];
	[[[self window] contentView] setFooterView:inFooterView];
	
	footerView = inFooterView;
	
}

- (CPView) footerView {
	
	return footerView;
	
}

- (void) setContentView:(CPView)inContentView {
	
	[contentWrapperView setDocumentView:inContentView];
	contentView = inContentView;
	
}

- (CPView) contentView {
	
	return [contentWrapperView documentView];
	
}





@end

@implementation IRActionSheetLayoutView : CPView  {
	
	CPView headerView @accessors;
	CPView contentView @accessors;
	CPView footerView @accessors;
	
}

- (void) setHeaderView:(CPView)inView {
	
	if (!inView || inView == headerView) return;
	if (headerView) [headerView removeFromSuperview];

	headerView = inView;
	[self addSubview:headerView positioned:CPWindowAbove relativeTo:contentView];
	
}

- (void) setContentView:(CPView)inView {
	
	if (!inView || inView == contentView) return;
	if (contentView) [contentView removeFromSuperview];

	contentView = inView;
	[self addSubview:contentView];
	
}

- (void) setFooterView:(CPView)inView {
	
	CPLog(@"setFooterView: %@", inView);
	
	if (!inView || inView == footerView) return;
	if (footerView) [footerView removeFromSuperview];

	footerView = inView;
	[self addSubview:footerView positioned:CPWindowAbove relativeTo:contentView];
	
	CPLog(@"done, footerView is now %@", footerView);
	
}


- (void) layoutSubviews {
	
	if (!contentView) return;
	
	var	totalWidth = CGRectGetWidth([self frame]),
		totalHeight = CGRectGetHeight([self frame]), 
		headerViewHeight = headerView ? CGRectGetHeight([headerView frame]) : 0,
		footerViewHeight = footerView ? CGRectGetHeight([footerView frame]) : 0;
	
	if (headerView) [headerView setFrame:CGRectMake(0, 0, totalWidth, headerViewHeight)];
	
	[contentView setFrame:CGRectMake(0, headerViewHeight, totalWidth, totalHeight - headerViewHeight - footerViewHeight)];
	
	if (footerView) [footerView setFrame:CGRectMake(0, totalHeight - footerViewHeight, totalWidth, footerViewHeight)];
	
}

@end




