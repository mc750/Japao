//
//  ReservadoConcluidoViewController.m
//  Grafitaki
//
//  Created by Renato Y. Soma on 02/06/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import "ReservadoConcluidoViewController.h"
#import "Gerente.h"
#define ACAO_RESERVAR 0
#define ACAO_CONCLUIR 1

@interface ReservadoConcluidoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *perfilGrafiteiro;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *actionButton;
@property (weak, nonatomic) IBOutlet UILabel *endereco;
@property (weak, nonatomic) IBOutlet UILabel *telefone;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *labelVariavel;
@end

@implementation ReservadoConcluidoViewController
- (IBAction)mudarSection:(id)sender {
    //Implementar funcionalidade de mudar os anuncios de secao
    if(self.tipoView==ACAO_RESERVAR){
        for (Anuncio *temp in [Gerente gerente].arrayAnuncios) {
            if([temp isEqual:self.anuncio]){
                [[Gerente gerente].arrayReservados addObject:temp];
                [[Gerente gerente].arrayAnuncios removeObject:temp];
            }
        }
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
    }else if (self.tipoView==ACAO_CONCLUIR){
        for(Anuncio *temp in [Gerente gerente].arrayReservados){
            if([temp isEqual:self.anuncio]){
                [[Gerente gerente].arrayConcluidos addObject:temp];
                [[Gerente gerente].arrayReservados removeObject:temp];
            }
        }
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:2] animated:YES];
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.perfilGrafiteiro.hidden=YES;
    if(self.tipoView==ACAO_RESERVAR){
        self.actionButton.title=@"Reservar muro";
    }else if (self.tipoView==ACAO_CONCLUIR){
        self.labelVariavel.text=@"Grafiteiro:";
        self.actionButton.title=@"Concluir muro";
    }else{
        self.labelVariavel.text=@"Grafiteiro:";
        self.navigationItem.rightBarButtonItem=nil;
    }
    self.endereco.text=self.anuncio.endereco;
    self.email.text=self.anuncio.email;
    if(self.tipoView==0){
        self.telefone.text=[NSString stringWithFormat:@"%d", self.anuncio.telefone];
    }else{
//        self.telefone.text=COLOCAR O NOME DO GRAFITEIRO
        self.perfilGrafiteiro.hidden=NO;
        self.perfilGrafiteiro.titleLabel.text=@"Perfil";
        //Adicionar acao de ver o perfil do grafiteiro
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
