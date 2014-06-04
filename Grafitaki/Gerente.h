//
//  Gerente.h
//  Grafitaki
//
//  Created by Renato Yoshio Soma on 02/06/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gerente : NSObject
+(Gerente*)gerente;
@property (nonatomic, strong) NSMutableArray *arrayAnuncios;
@property (nonatomic, strong) NSMutableArray *arrayReservados;
@property (nonatomic, strong) NSMutableArray *arrayConcluidos;
@property (nonatomic, strong) NSMutableArray *arrayCallouts;
@end
