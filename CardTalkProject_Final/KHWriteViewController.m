//
//  KHWriteViewController.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 6. 1..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHWriteViewController.h"

@interface KHWriteViewController ()

@end

@implementation KHWriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentTextView.delegate = self;
    self.titleTextField.delegate = self;
    isTextWrritten = false;
    isTitleWritten = false;
    self.manager = [[KHCardTalkDataManager alloc] init];
    self.manager.communicator = [[KHCardTalkCommunicator alloc] init];
    self.manager.communicator.delegate = self.manager;
    self.manager.cardBuilder = [[KHCardBuilder alloc] init];
    self.manager.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, self.cameraButton.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
    
    if (!isTitleWritten) {
        textField.text = @"";
        textField.textColor = [UIColor blackColor];
        isTitleWritten = true;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointZero animated:YES];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    CGPoint scrollPoint = CGPointMake(0, self.cameraButton.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
    
    if (!isTextWrritten) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor];
        isTextWrritten = true;
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self.scrollView setContentOffset:CGPointZero animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.chosenImage = info[UIImagePickerControllerEditedImage];
    CGSize imageSize = _chosenImage.size;
    CGSize imageViewSize = self.cameraImageView.frame.size;
    CGFloat correctImageViewHeight = (imageViewSize.width / imageSize.width) * imageSize.height;
    
    [self.imageViewHeightConstraint setConstant:correctImageViewHeight];
    self.cameraImageView.image = self.chosenImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}
- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)postMessageAction:(id)sender {
    NSData *data = UIImageJPEGRepresentation([UIImage imageNamed:@"ib_addphoto"], 1.0);
    if (self.chosenImage)
        data = UIImageJPEGRepresentation(self.chosenImage, 1.0);
//    NSDictionary *cardDict = @{ @"title":self.titleTextField.text,
//                                @"content":self.contentTextView.text,
//                                @"imageData":data
//                                };
    
//    [self.manager postCard:cardDict];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM월 dd일 hh:mm a"];
    KHRealmCardModel *card = [[KHRealmCardModel alloc] initWithTitle:self.titleTextField.text
                                                          createTime:[dateFormatter stringFromDate:[NSDate date]]
                                                              userId:@"user03"
                                                           imageData:data];
    card.content = self.contentTextView.text;
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:card];
    [realm commitWriteTransaction];
    [self didPostCard:card];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cameraOpenAction:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:NULL];
}

-(void)didPostCard:(KHRealmCardModel *)card {

    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotificationName:@"post card" object:nil userInfo:@{@"card":card}];
}



@end
