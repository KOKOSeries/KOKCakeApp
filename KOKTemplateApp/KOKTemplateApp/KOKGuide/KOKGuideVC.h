//
//  KOKGuideVC.h
//  KOKTemplateApp
//
//  Created by KOK on 8/12/2020.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol KOKGuideVCDelegate <NSObject>
- (void)didClickCancel;
@end
@interface KOKGuideVC : UIViewController
@property (weak,nonatomic) id<KOKGuideVCDelegate> mkDelegate;
@end

NS_ASSUME_NONNULL_END
