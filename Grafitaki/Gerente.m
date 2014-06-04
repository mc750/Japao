//
//  Gerente.m
//  Grafitaki
//
//  Created by Renato Yoshio Soma on 02/06/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import "Gerente.h"

@implementation Gerente
static Gerente *gerente;
-(id)init{
    self=[super init];
    if(self){
        self.arrayAnuncios=[[NSMutableArray alloc]init];
        self.arrayConcluidos=[[NSMutableArray alloc]init];
        self.arrayReservados=[[NSMutableArray alloc]init];
        self.arrayCallouts=[[NSMutableArray alloc]init];
    }
    return self;
}
+(Gerente*)gerente{
    if(!gerente){
        gerente=[[Gerente alloc]init];
    }
    return gerente;
}
@end
