//
//  KHLoginViewController.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 31..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KHCardTalkDataManager.h"
#import "KHLoginView.h"
#import "KHCardTalkManagerDelegate.h"

@interface KHLoginViewController : UIViewController <KHCardTalkManagerDelegate, UITextFieldDelegate>

@property (strong,nonatomic) KHCardTalkDataManager *manager;
@property (strong,nonatomic) KHCardTalkDataManager *mainManager;
@property (strong, nonatomic) IBOutlet KHLoginView *loginView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
