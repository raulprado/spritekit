//
//  RTPMyScene.m
//  Mini_tutorial_spritekit
//
//  Created by RAUL TAVARES DO PRADO on 24/04/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "RTPMyScene.h"

int x = 0;

@implementation RTPMyScene

@synthesize sprite;

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        // Define a cor de fundo do cenário.
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        // Cria um label para desenhar no cenário.
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        // Adiciona o label no cenário.
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    // A parte comentada abaixo é o exemplo que já vem pronto quando voce cria um novo projeto do tipo SpriteKit Game.
    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        // Cria o Sprite com a imagem spaceship
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.position = location;
//        
//        // Cria a açao de rodar em um angulo de PI
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        // Faz com que a açao execute continuamente
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
    
    // Recupera o touch
    
   
    
    UITouch *touch = [[touches allObjects]objectAtIndex:0];
    CGPoint location = [touch locationInNode:self];
    
    // Flag para reexibir o srite quando você o exclui. Repare que ao clicar sob a nave você apenas a removeu da cena, mas ela continua alocada.
    if (x==1) {
        [self addChild:sprite];
        x=0;
    }
    //Se não existe cria o sprite
    if(! sprite){
      //Cria o sprite com a imagem spaceship.png
        sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
      //Define que a posição do sprite é a posição do touch
        sprite.position = location;
      
      // Cria a açao de rodar em um angulo de PI
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];

      // Faz com que a açao execute continuamente
        [sprite runAction:action];
        
      // Adiciona o sprite no cenário
        [self addChild:sprite];
        NSLog(@"Sprite criado!");
    }else{
        // Se existe verifica se o touch
        if ([sprite containsPoint:location]) {
            // Remove o sprite do cenário se tocou nele.
            [sprite removeFromParent];
            NSLog(@"Sprite removido!");
            x=1;
        }else{
            // Move o sprite para a nova localização
            SKAction *actionMover = [SKAction moveTo:location duration:1.0];
            [sprite runAction:actionMover];
        }
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
