//
//  KOKGuideVC.m
//  KOKTemplateApp
//
//  Created by KOK on 8/12/2020.
//

#import "KOKGuideVC.h"

@interface KOKGuideVC ()

@end

@implementation KOKGuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.mkDelegate respondsToSelector:@selector(didClickCancel)]) {
        [self.mkDelegate didClickCancel];
    }
}
@end
