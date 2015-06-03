//
//  KHWriteViewController.h
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 6. 1..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "KHCardTalkManagerDelegate.h"
#import "KHCardTalkCommunicator.h"
#import "KHCardTalkDataManager.h"
#import "KHRealmCardModel.h"
#import "KHMainTableViewDataSource.h"


@interface KHWriteViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, KHCardTalkManagerDelegate> {
    BOOL isTitleWritten;
    BOOL isTextWrritten;
}

@property (strong, nonatomic) KHCardTalkDataManager *manager;
@property (strong, nonatomic) KHMainTableViewDataSource *dataSource;
@property (strong, nonatomic) UIImage *chosenImage;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UIImageView *cameraImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end
