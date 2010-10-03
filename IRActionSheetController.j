//	IRActionSheetController.j
	
	
	
	
	
@implementation IRActionSheetController : CPWindowController {
	
	CPView headerView;
	CPView contentView;
	CPView footerView;
	
	CPView wrapperView;
	CPView backdropView;
	
	id representedObject @accessors;
	
}

- (void) loadWindow {
	
	if (_window) return;
	
	_window = [[CPWindow alloc] initWithContentRect:CGRectMake(0, 0, 512, 512) styleMask:CPDocModalWindowMask];	
	[_window._windowView setClipsToBounds:NO];
	
	[_window._windowView setBackgroundColor:[CPColor redColor]];

	backdropView = [[IRBeigeBox alloc] initWithFrame:CGRectMake(0, -32, 512, 512 + 32)];
	[[_window contentView] addSubview:backdropView];
	[backdropView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[[_window contentView] setClipsToBounds:NO];
	[[_window contentView] setAutoresizesSubviews:YES];
	
	wrapperView = [[CPView alloc] initWithFrame:CGRectMake(0, 0, 512, 512)];
	[wrapperView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[[_window contentView] addSubview:wrapperView];

	[_window setHasShadow:NO];

}





- (void) setHeaderView:(CPView)inHeaderView {
	
	if (inHeaderView == nil) return;
	if (inHeaderView == headerView) return;
	[headerView removeFromSuperview];
	headerView = inHeaderView;
	
	[wrapperView addSubview:headerView];
	[self layout];
	
}

- (CPView) headerView {
	
	return headerView;
	
}

- (void) setFooterView:(CPView)inFooterView {
	
	if (inFooterView == nil) return;
	if (inFooterView == footerView) return;
	[footerView removeFromSuperview];
	footerView = inFooterView;
	
	[wrapperView addSubview:footerView];
	[self layout];
	
}

- (void) footerView {
	
	return footerView;
	
}

- (void) setContentView:(CPView)inContentView {
	
	if (inContentView == nil) return;
	if (inContentView == contentView) return;
	[contentView removeFromSuperview];
	contentView = inContentView;
	[contentView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[contentView setFrame:CGRectMake(0, 0, CGRectGetWidth([wrapperView frame]), CGRectGetHeight([wrapperView frame]))];

	[wrapperView addSubview:contentView];
	[self layout];
	
}

- (void) contentView {
	
	return contentView;
	
}





- (void) layout {
	
	var fullFrameWidth = CGRectGetWidth([wrapperView frame]);
	var fullFrameHeight = CGRectGetHeight([wrapperView frame]);
	
	//	Lay out the content view
	
	var headerViewHeight = (headerView == nil) ? 0 : CGRectGetHeight([headerView frame]);
	var footerViewHeight = (footerView == nil) ? 0 : CGRectGetHeight([footerView frame]);

	[headerView setFrame:CGRectMake(
		
		0, 0, 
		fullFrameWidth, 
		headerViewHeight
		
	)];
	
	[contentView setFrame:CGRectMake(
		
		0, headerViewHeight, 
		fullFrameWidth, 
		fullFrameHeight - headerViewHeight - footerViewHeight
		
	)];
	
	[footerView setFrame:CGRectMake(
		
		0, fullFrameHeight - footerViewHeight, 
		fullFrameWidth, 
		footerViewHeight
		
	)];

}





@end




