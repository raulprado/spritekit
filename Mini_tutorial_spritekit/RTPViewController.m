//
//  RTPViewController.m
//  Mini_tutorial_spritekit
//
//  Created by RAUL TAVARES DO PRADO on 24/04/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "RTPViewController.h"
#import "RTPMyScene.h"

@implementation RTPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configura a view (faz casting para a SKView definida no xib)
    SKView * skView = (SKView *)self.view;
    
    //Exibe informaçoes de debug
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Cria o cenário
    SKScene * scene = [RTPMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Exibe o cenário
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
