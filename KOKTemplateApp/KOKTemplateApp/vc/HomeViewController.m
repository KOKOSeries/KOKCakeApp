//
//  HomeViewController.m
//  KOKTemplateApp
//
//  Created by KOK on 4/12/2020.
//

#import "HomeViewController.h"
#import "YYFPSLabel.h"
#import "SceneDelegate.h"
#import "SDCycleScrollView.h"
#import <Masonry/Masonry.h>
#define introduceH  120
@interface HomeViewController ()
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    demoContainerView.contentSize = CGSizeMake(self.view.frame.size.width, 3*1200);
    demoContainerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:demoContainerView];
    
    
    //  type  介绍
    UIView *introduceView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,introduceH)];
    introduceView.backgroundColor = [UIColor whiteColor];
    //
    UILabel *introduceLabel  = [[UILabel alloc]init];
    introduceLabel.text = @"Introduce";
    [introduceView addSubview:introduceLabel];
    [introduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(introduceView);
        make.left.equalTo(@(20));
    }];
    
    NSArray *introduceImageNames = @[@"冰淇淋蛋糕.jpg",
                                     @"布丁蛋糕.jpg",
                                     @"海绵蛋糕.jpeg",
                                     @"慕斯蛋糕.jpg",
                                     @"戚风蛋糕.jpg",
                                     @"巧克力蛋糕.jpg",
                                     @"水果蛋糕.jpg",
                                     @"鲜奶油蛋糕.jpg",
                                     @"芝士蛋糕.jpg"
    ];
    NSArray *introduceTitles = @[@"冰淇淋蛋糕",
                                 @"布丁蛋糕",
                                 @"海绵蛋糕",
                                 @"慕斯蛋糕",
                                 @"戚风蛋糕",
                                 @"巧克力蛋糕",
                                 @"水果蛋糕",
                                 @"鲜奶油蛋糕",
                                 @"芝士蛋糕"
                        ];
    
    
    SDCycleScrollView *introduceCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-introduceH,0,introduceH*2,introduceH) shouldInfiniteLoop:YES imageNamesGroup:introduceImageNames];
    introduceCycleScrollView.titlesGroup = introduceTitles;
    [introduceView addSubview:introduceCycleScrollView];
    introduceCycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    introduceCycleScrollView.pageControlDotSize = CGSizeMake(3, 3);
    __weak __typeof(self)weakSelf = self;
    introduceCycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
//        if (strongSelf.isCanSkip) {
//
//        }else{
//            return;
//        }
//
//        if ([strongSelf.mkDelegate respondsToSelector:@selector(didClickCancel)]) {
//            [strongSelf.mkDelegate didClickCancel];
//        }
    };
    introduceCycleScrollView.itemDidScrollOperationBlock = ^(NSInteger currentIndex) {
        NSLog(@"%@",@(currentIndex));
        __strong __typeof(weakSelf)strongSelf = weakSelf;
//        if (currentIndex == 2) {
//            strongSelf.isCanSkip = YES;
//        }
    };
    [demoContainerView addSubview:introduceView];
    
    
    
    
}

@end
