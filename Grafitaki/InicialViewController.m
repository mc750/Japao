//
//  InicialViewController.m
//  Grafitaki
//
//  Created by Renato Yoshio Soma on 26/05/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import "InicialViewController.h"

@interface InicialViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) int pwd;
@end

@implementation InicialViewController
- (IBAction)login:(id)sender {
    if([self.usernameTextField.text isEqual:self.username]){
        int passAtempt=[self.pwdTextField.text intValue];
        if(passAtempt == self.pwd){
            self.pwdTextField.text=nil;
            self.usernameTextField.text=nil;
            [self performSegueWithIdentifier:@"GoToPrincipal" sender:nil];
        }
    }else{
        //Alerta que o usuario errou o login
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error"
                                                     message:@"Usuário ou senha incorretos"
                                                    delegate:self
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles: nil];
        [alert show];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self dismissKeyboard];
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.usernameTextField.delegate=self;
    self.pwdTextField.delegate=self;
    self.username=[NSString stringWithFormat:@"root"];
    self.pwd=1234;
    
    // Dismiss keyboard
    UIGestureRecognizer *gesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard{
    [self.usernameTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
