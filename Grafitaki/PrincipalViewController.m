//
//  PrincipalViewController.m
//  Grafitaki
//
//  Created by Renato Yoshio Soma on 26/05/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import "PrincipalViewController.h"
#import <MapKit/MapKit.h>
#import "MeusMurosViewController.h"
#define WIDTH 100
#define NUMBER_OF_SECTIONS 7

@interface PrincipalViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) NSArray *buttonsNames;
@property (nonatomic, assign) BOOL menuIsHidden;
@property (nonatomic, strong) UIView *sideMenu;
@property (nonatomic, strong) MeusMurosViewController *muros;
@end

@implementation PrincipalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menuIsHidden=YES;
    self.sideMenu=[[UIView alloc]initWithFrame:CGRectMake(self.mapView.frame.origin.x-WIDTH, self.mapView.frame.origin.y, WIDTH, self.mapView.frame.size.height)];
    self.sideMenu.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.sideMenu];
    self.buttonsNames=[NSArray arrayWithObjects:@"Nome", @"Meus Muros", @"Minhas Artes", @"Mensagens", @"Novas Obras", @"Contatos", @"Sair", nil];
    [self allocMenu];
}

/*Funcao que move os elementos de tela: menu e o mapa*/
- (IBAction)showMenuItens:(id)sender {
    if(self.menuIsHidden){
        [self showMenu];
    }else{
        [self hideMenu];
    }
}

/*Desloca para mostrar o menu*/
-(void)showMenu{
    [self changeSideMenuRect:CGRectMake(self.mapView.frame.origin.x, self.mapView.frame.origin.y, WIDTH, self.mapView.frame.size.height)];
    [self moveMap:CGRectMake(self.mapView.frame.origin.x+WIDTH, self.mapView.frame.origin.y, self.mapView.frame.size.width, self.mapView.frame.size.height)];
    self.menuIsHidden=NO;
}
/*Desloca para esconder o menu*/
-(void)hideMenu{
    [self moveMap:CGRectMake(self.mapView.frame.origin.x-WIDTH, self.mapView.frame.origin.y, self.mapView.frame.size.width, self.mapView.frame.size.height)];
    [self changeSideMenuRect:CGRectMake(self.mapView.frame.origin.x-WIDTH, self.mapView.frame.origin.y, WIDTH, self.mapView.frame.size.height)];
    self.menuIsHidden=YES;
}

/*Cria botões a serem usados no menu lateral*/
-(void)allocMenu{
    for(int i=0; i<NUMBER_OF_SECTIONS; i++){
        float buttonHeight=self.sideMenu.frame.size.height/NUMBER_OF_SECTIONS;
        UIButton *sideBarButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [sideBarButton setTag:i];   //Tag para identificar o botão posteriormente através do toque
        [sideBarButton addTarget:self action:@selector(buttonChosen:) forControlEvents:UIControlEventTouchUpInside];
        NSString *temp=self.buttonsNames[i];
        [sideBarButton setTitle:temp forState:UIControlStateNormal];
        sideBarButton.frame=CGRectMake(self.sideMenu.bounds.origin.x, self.sideMenu.bounds.origin.y+buttonHeight*i, WIDTH, buttonHeight);   //Bounds pois é em relaçao a sideMenu
        [self.sideMenu addSubview:sideBarButton];
    }
}

/*Animação: Move o mapa quando o menu lateral aparecer*/
-(void)moveMap:(CGRect)rect{
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.mapView setFrame:rect];
                     }
                     completion:nil
     ];

}

/*Animação: Mostra ou esconde o menu lateral*/
-(void)changeSideMenuRect:(CGRect)rect{
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.sideMenu setFrame:rect];
                     }
                     completion:nil
                     ];
}

/*Ações dos diferentes botões*/
-(void)buttonChosen:(UIButton*)button{
    switch ([button tag]) {
        case 0:
            //Goto Name
            NSLog(@"Nome do user");
            break;
        case 1:
            [self performSegueWithIdentifier:@"GoToMuros" sender:nil];
            [self hideMenu];
            break;
        case 2:
            NSLog(@"Minhas artes");
            break;
        case 3:
            NSLog(@"Mensagens");
            break;
        case 4:
            NSLog(@"Novas obras");
            break;
        case 5:
            NSLog(@"Contatos");
            break;
        case 6:
            NSLog(@"Sair");
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if([segue.identifier isEqualToString:@"GoToMuros"]){
//    }
}


@end
