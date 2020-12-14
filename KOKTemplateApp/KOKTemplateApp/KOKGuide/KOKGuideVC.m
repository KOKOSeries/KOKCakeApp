//
//  KOKGuideVC.m
//  KOKTemplateApp
//
//  Created by KOK on 8/12/2020.
//

#import "KOKGuideVC.h"
#import "SDCycleScrollView.h"
#import <Masonry/Masonry.h>
@interface KOKGuideVC ()
@property (strong,nonatomic) UIButton *skipButton;
@property (assign,nonatomic) BOOL isCanSkip;

@end

@implementation KOKGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.skipButton = [[UIButton alloc]init];
    [self.skipButton setTitle:@"跳过" forState:UIControlStateNormal];
    
    NSArray *imageNames = @[@"h1.jpg",
                            @"h2.jpg",
                            @"h3.jpg",
                            ];
    NSArray *titles = @[@"新建交流QQ群：185534916 ",
                        @"disableScrollGesture可以设置禁止拖动",
                        @"感谢您的支持，如果下载的",
                        ];
 
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    cycleScrollView.titlesGroup = titles;
    [self.view addSubview:cycleScrollView];
    cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    __weak __typeof(self)weakSelf = self;
    cycleScrollView.clickItemOperationBlock = ^(NSInteger currentIndex) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        if (strongSelf.isCanSkip) {
            
        }else{
            return;
        }
        
        if ([strongSelf.mkDelegate respondsToSelector:@selector(didClickCancel)]) {
            [strongSelf.mkDelegate didClickCancel];
        }
    };
    cycleScrollView.itemDidScrollOperationBlock = ^(NSInteger currentIndex) {
        NSLog(@"%@",@(currentIndex));
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        if (currentIndex == 2) {
            strongSelf.isCanSkip = YES;
        }
    };
    [self.view addSubview:self.skipButton];
    [self.skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(10));
        make.top.equalTo(@(80));
        make.width.equalTo(@(80));
        make.height.equalTo(@(30));
    }];
    self.skipButton.layer.cornerRadius = 15;
    self.skipButton.layer.masksToBounds = YES;
    self.skipButton.layer.borderColor = [UIColor colorNamed:@"tintColor"].CGColor;
    self.skipButton.layer.borderWidth = 0.5;
    self.isCanSkip = NO;
    [self.skipButton addTarget:self action:@selector(skipHander) forControlEvents:UIControlEventTouchUpInside];
}
- (void)skipHander{
    if ([self.mkDelegate respondsToSelector:@selector(didClickCancel)]) {
        [self.mkDelegate didClickCancel];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (self.isCanSkip) {
        
    }else{
        return;
    }
    
    if ([self.mkDelegate respondsToSelector:@selector(didClickCancel)]) {
        [self.mkDelegate didClickCancel];
    }
}
@end
