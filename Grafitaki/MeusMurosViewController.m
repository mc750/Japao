//
//  MeusMurosViewController.m
//  Grafitaki
//
//  Created by Renato Yoshio Soma on 26/05/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import "MeusMurosViewController.h"
#import "Anuncio.h"
#import "Gerente.h"
#import "ReservadoConcluidoViewController.h"

@interface MeusMurosViewController () <UITableViewDataSource, UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) int sectionNumber;
@property (nonatomic, strong) Anuncio *anuncio;
@end

@implementation MeusMurosViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0){
        return @"Disponíveis";
    }else if (section==1){
        return @"Reservados";
    }else{
        return @"Concluídos";
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0){
        if([Gerente gerente].arrayAnuncios.count == 0){
            return 1;
        }else{
            return [Gerente gerente].arrayAnuncios.count;
        }
    }else if (section==1){
        if([Gerente gerente].arrayReservados.count == 0){
            return 1;
        }else{
            return [Gerente gerente].arrayReservados.count;
        }
    }else{
        if([Gerente gerente].arrayConcluidos.count == 0){
            return 1;
        }else{
            return [Gerente gerente].arrayConcluidos.count;
        }
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(indexPath.section==0){
        if(cell==nil){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        NSArray *temp=[Gerente gerente].arrayAnuncios;
        if(temp.count==0){
            cell.textLabel.text=@"Sem muros disponíveis.";
        }else{
            Anuncio *tempAnuncio=temp[indexPath.row];
            cell.textLabel.text=tempAnuncio.endereco;
        }
    }else if (indexPath.section==1){
        if(cell==nil){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        NSArray *temp=[Gerente gerente].arrayReservados;
        if(temp.count==0){
            cell.textLabel.text=@"Não há muros reservados.";
        }else{
            Anuncio *tempAnuncio=temp[indexPath.row];
            cell.textLabel.text=tempAnuncio.endereco;
        }
    }else{
        if(cell==nil){
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        NSArray *temp=[Gerente gerente].arrayConcluidos;
        if(temp.count==0){
            cell.textLabel.text=@"Não há muros concluídos.";
        }else{
            Anuncio *tempAnuncio=temp[indexPath.row];
            cell.textLabel.text=tempAnuncio.endereco;
        }
    }
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        self.sectionNumber=0;
        if([Gerente gerente].arrayAnuncios.count>0){
            self.anuncio=[Gerente gerente].arrayAnuncios[indexPath.row];
            [self performSegueWithIdentifier:@"GoToAnuncio" sender:self];
        }
    }else if(indexPath.section==1){
        self.sectionNumber=1;
        if([Gerente gerente].arrayReservados.count>0){
            self.anuncio=[Gerente gerente].arrayReservados[indexPath.row];
            [self performSegueWithIdentifier:@"GoToAnuncio" sender:self];
        }
    }else{
        self.sectionNumber=2;
        if([Gerente gerente].arrayConcluidos.count>0){
            self.anuncio=[Gerente gerente].arrayConcluidos[indexPath.row];
            [self performSegueWithIdentifier:@"GoToAnuncio" sender:self];
        }
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([[segue identifier] isEqualToString:@"GoToAnuncio"]){
        ReservadoConcluidoViewController *temp=[segue destinationViewController];
        temp.tipoView=self.sectionNumber;
        temp.anuncio=self.anuncio;
    }
}


@end
