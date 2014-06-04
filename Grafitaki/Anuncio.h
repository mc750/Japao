//
//  Anuncio.h
//  Grafitaki
//
//  Created by Renato Yoshio Soma on 02/06/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Anuncio : NSObject
@property (nonatomic, strong) UIImage *fotoMuro;
@property (nonatomic, strong) NSString *endereco;
@property (nonatomic, strong) NSString *artista;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, assign) int telefone;
@end
