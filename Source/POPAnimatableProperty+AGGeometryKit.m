//
// Author: Håvard Fossli <hfossli@agens.no>
// Author: https://github.com/kennytm
//
// Copyright (c) 2013 Agens AS (http://agens.no/)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "POPAnimatableProperty+AGGeometryKit.h"
#import "AGGeometryKit.h"

static CGFloat const kPOPLayerAGKQuadThreshold = 1.0;

NSString * const kPOPLayerAGKQuad = @"quadrilateral";

NSString * const kPOPLayerAGKQuadTopLeft = @"quadrilateral.tl";
NSString * const kPOPLayerAGKQuadTopLeftX = @"quadrilateral.tl.x";
NSString * const kPOPLayerAGKQuadTopLeftY = @"quadrilateral.tl.y";

NSString * const kPOPLayerAGKQuadTopRight = @"quadrilateral.tr";
NSString * const kPOPLayerAGKQuadTopRightX = @"quadrilateral.tr.x";
NSString * const kPOPLayerAGKQuadTopRightY = @"quadrilateral.tr.y";

NSString * const kPOPLayerAGKQuadBottomLeft = @"quadrilateral.bl";
NSString * const kPOPLayerAGKQuadBottomLeftX = @"quadrilateral.bl.x";
NSString * const kPOPLayerAGKQuadBottomLeftY = @"quadrilateral.bl.y";

NSString * const kPOPLayerAGKQuadBottomRight = @"quadrilateral.br";
NSString * const kPOPLayerAGKQuadBottomRightX = @"quadrilateral.br.x";
NSString * const kPOPLayerAGKQuadBottomRightY = @"quadrilateral.br.y";

@implementation POPAnimatableProperty (AGK)

+ (NSArray *)AGKAnimatableProperties
{
    static NSArray *props;

    if(props == nil)
    {
        props =
        @[
          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuad initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  for(int i = 0; i < 4; i++)
                  {
                      CGPoint p = layer.outerQuadrilateral.v[i];
                      values[(i*2)] = p.x;
                      values[(i*2)+1] = p.y;
                  }
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = AGKQuadZero;
                  for(int i = 0; i < 4; i++)
                  {
                      CGPoint p = CGPointMake(values[(i*2)], values[(i*2)+1]);
                      q.v[i] = p;
                  }

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadTopLeft initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.tl.x;
                  values[1] = layer.outerQuadrilateral.tl.y;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.tl = CGPointMake(values[0], values[1]);
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadTopLeftX initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.tl.x;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.tl.x = values[0];
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadTopLeftY initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.tl.y;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.tl.y = values[0];
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadTopRight initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.tr.x;
                  values[1] = layer.outerQuadrilateral.tr.y;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.tr = CGPointMake(values[0], values[1]);
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadTopRightX initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.tr.x;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.tr.x = values[0];
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadTopRightY initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.tr.y;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.tr.y = values[0];
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadBottomLeft initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.bl.x;
                  values[1] = layer.outerQuadrilateral.bl.y;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.bl = CGPointMake(values[0], values[1]);
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadBottomLeftX initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.bl.x;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.bl.x = values[0];
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadBottomLeftY initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.bl.y;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.bl.y = values[0];
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadBottomRight initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.br.x;
                  values[1] = layer.outerQuadrilateral.br.y;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.br = CGPointMake(values[0], values[1]);
                  layer.outerQuadrilateral = q;
                  
              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadBottomRightX initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.br.x;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.br.x = values[0];
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          [POPAnimatableProperty propertyWithName:kPOPLayerAGKQuadBottomRightY initializer:^(POPMutableAnimatableProperty *prop) {
              prop.readBlock = ^(CALayer *layer, CGFloat values[]) {
                  values[0] = layer.outerQuadrilateral.br.y;
              };
              prop.writeBlock = ^(CALayer *layer, const CGFloat values[]) {
                  AGKQuad q = layer.outerQuadrilateral;
                  q.br.y = values[0];
                  layer.outerQuadrilateral = q;

              };
              prop.threshold = kPOPLayerAGKQuadThreshold;
          }],

          ];
    }

    return props;
}

+ (instancetype)AGKPropertyWithName:(NSString *)aName
{
    NSArray *props = [self AGKAnimatableProperties];

    for(POPAnimatableProperty *prop in props)
    {
        if([prop.name isEqualToString:aName])
        {
            return prop;
        }
    }

    return nil;
}

@end
