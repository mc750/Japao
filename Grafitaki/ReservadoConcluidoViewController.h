//
//  ReservadoConcluidoViewController.h
//  Grafitaki
//
//  Created by Renato Y. Soma on 02/06/14.
//  Copyright (c) 2014 Renato Yoshio Soma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Anuncio.h"

@interface ReservadoConcluidoViewController : UIViewController
@property (nonatomic, assign) int tipoView;
@property (nonatomic, strong) Anuncio *anuncio;
@end
