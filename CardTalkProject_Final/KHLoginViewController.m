//
//  KHLoginViewController.m
//  CardTalkProject_Final
//
//  Created by Hyungjin Ko on 2015. 5. 31..
//  Copyright (c) 2015년 Hyungjin Ko. All rights reserved.
//

#import "KHLoginViewController.h"

@interface KHLoginViewController ()

@end

@implementation KHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.loginView.idTextField.delegate = self;
    self.loginView.passwordTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {

    NSString *userid = self.loginView.idTextField.text;
    NSString *password = self.loginView.passwordTextField.text;
    
    NSDictionary *userInfo = @{ @"userid":userid, @"password":password };
    [self.manager postLogin:userInfo];
    NSLog(@"%@, %@", userid, password);
    [self dismissViewControllerAnimated:YES completion:^(void){
        [self.mainManager fetchCards];
    }];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    CGPoint scrollPoint = CGPointMake(0, self.loginView.idTextField.frame.origin.y);
    [self.scrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointZero animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
