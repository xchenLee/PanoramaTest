//
//  ViewController.m
//  PanoramaTest
//
//  Created by renren on 16/10/26.
//  Copyright © 2016年 com.lee.lucky. All rights reserved.
//

#import "ViewController.h"
#import "GVRPanoramaView.h"

static const CGFloat kMargin = 16;
static const CGFloat kPanoViewHeight = 250;

@interface ViewController ()<GVRWidgetViewDelegate>

@property (nonatomic, strong) GVRPanoramaView *panoView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //[self.view addSubview:_scrollView];
    
    _panoView = [[GVRPanoramaView alloc] init];
    _panoView.userInteractionEnabled = YES;
    _panoView.delegate = self;
    _panoView.enableFullscreenButton = YES;
    _panoView.enableCardboardButton = YES;
    _panoView.enableTouchTracking = YES;
    [_panoView loadImage:[UIImage imageNamed:@"andes.jpg"]
                  ofType:kGVRPanoramaImageTypeStereoOverUnder];
    [self.view addSubview:_panoView];

    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _panoView.frame = CGRectMake(kMargin,20,
                                 CGRectGetWidth(self.view.bounds) - 2 * kMargin,
                                 kPanoViewHeight);
    
}

- (void)setFrameForView:(UIView *)view belowView:(UIView *)topView margin:(CGFloat)margin {
    CGSize size =
    [view sizeThatFits:CGSizeMake(CGRectGetWidth(self.view.bounds) - 2 * kMargin, CGFLOAT_MAX)];
    view.frame = CGRectMake(kMargin, CGRectGetMaxY(topView.frame) + margin, size.width, size.height);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
