//
//  AnuncioViewController.m
//  Grafitaki
//
//  Created by Renato Y. Soma on 01/06/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import "AnuncioViewController.h"
#import "Anuncio.h"
#import "Gerente.h"

@interface AnuncioViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *editarFoto;
@property (weak, nonatomic) IBOutlet UITextField *enderecoTextField;
@property (weak, nonatomic) IBOutlet UITextField *numeroTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation AnuncioViewController

- (IBAction)publicar:(id)sender {
    //Add codigo que salva no singleton
    if([self.enderecoTextField.text isEqualToString:@""] || [self.emailTextField.text isEqualToString:@""] || [self.numeroTextField.text isEqualToString:@""]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error"
                                                     message:@"Preencha todos os campos"
                                                    delegate:self
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"Ok", nil];
        [alert show];
    }else{
        Anuncio *anuncio=[[Anuncio alloc]init];
        anuncio.endereco=self.enderecoTextField.text;
        anuncio.email=self.emailTextField.text;
        anuncio.telefone=[self.numeroTextField.text integerValue];
        [[Gerente gerente].arrayAnuncios addObject:anuncio];
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
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
    //Dismiss keyboard
    self.enderecoTextField.delegate=self;
    self.numeroTextField.delegate=self;
    self.emailTextField.delegate=self;
    UIGestureRecognizer *gesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:gesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard{
    [self.enderecoTextField resignFirstResponder];
    [self.emailTextField resignFirstResponder];
    [self.numeroTextField resignFirstResponder];
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
