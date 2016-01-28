//
//  Sticker.m
//  SelfieSticker
//
//  Created by Aaron B on 1/21/16.
//  Copyright © 2016 Bikis Design. All rights reserved.
//

#import "Sticker.h"
@interface Sticker () <UIGestureRecognizerDelegate>
@end

@implementation Sticker

- (instancetype) initWithImage:(UIImage *)image {
    
    self = [super initWithImage:image];
    
    if (self) {
        UIPanGestureRecognizer *pan  = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
        UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
        
        self.userInteractionEnabled = YES;
        self.gestureRecognizers = @[pan, pinch, rotate];
        for (UIGestureRecognizer *recognizer in self.gestureRecognizers) {
            recognizer.delegate = self;
            
        }
    }
    return self;
}

- (void) handlePan: (UIPanGestureRecognizer *) gestureRecognizer  {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
        [gestureRecognizer.view setTransform:CGAffineTransformTranslate(gestureRecognizer.view.transform, translation.x, translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:gestureRecognizer.view];
    }
}


- (void) handlePinch: (UIPinchGestureRecognizer *) gestureRecogonizer {
    if (gestureRecogonizer.state == UIGestureRecognizerStateBegan || gestureRecogonizer.state == UIGestureRecognizerStateChanged) {
        
        CGFloat scale = [gestureRecogonizer scale];
        
        [gestureRecogonizer.view setTransform:CGAffineTransformScale(gestureRecogonizer.view.transform, scale, scale)];
        [gestureRecogonizer setScale:1];
    }
}

- (void) handleRotate : (UIRotationGestureRecognizer *) gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        CGFloat rotate = [gestureRecognizer rotation];
        
        [gestureRecognizer.view setTransform:CGAffineTransformRotate(gestureRecognizer.view
                                                                     .transform, rotate)];
        [gestureRecognizer setRotation:0];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
