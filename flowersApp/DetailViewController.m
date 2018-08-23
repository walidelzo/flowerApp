//
//  DetailViewController.m
//  flowersApp
//
//  Created by walidelzo on 7/27/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic) UIImageView *image;
@property (strong,nonatomic)UIScrollView *scrollView;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _scrollView=[[UIScrollView alloc]init];
    _scrollView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_scrollView];
    
    self.image=[[UIImageView alloc]initWithImage:self.imageFromOtherPriviousView];
    [_scrollView addSubview:self.image];
    _scrollView.contentSize=self.image.frame.size;
    _scrollView.delegate=self;
    _scrollView.minimumZoomScale=.2;
    _scrollView.maximumZoomScale=5.0;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.image;
}
@end
