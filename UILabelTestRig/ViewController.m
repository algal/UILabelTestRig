//
//  ViewController.m
//  UILabelTestRig
//
//  Created by Alexis Gallagher on 2012-11-13.
//  Copyright (c) 2012 Foxtrot Studios. All rights reserved.
//

#import "ViewController.h"

#define COLOR_PALETTE_NAME ((NSArray*) @[@"white",@"black",@"green",@"nil"])
#define COLOR_PALETTE ((NSArray*) @[[UIColor whiteColor],[UIColor blackColor],[UIColor greenColor],[NSNull null]])

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // initialize controls
  self.stepperFontSize.minimumValue = 1.0f;
  self.stepperFontSize.maximumValue = 80.0f;
  self.stepperFontSize.value = self.theLabel.font.pointSize;
  
  self.segmentedShadowColor.selectedSegmentIndex =
  [COLOR_PALETTE indexOfObject:(self.theLabel.shadowColor ? self.theLabel.shadowColor : [NSNull null])];

  self.segmentedTextColor.selectedSegmentIndex =
  [COLOR_PALETTE indexOfObject:(self.theLabel.textColor ? self.theLabel.textColor : [NSNull null])];

  for (NSUInteger segmentIndex = 0; segmentIndex < [COLOR_PALETTE_NAME count]; ++segmentIndex) {
    [self.segmentedShadowColor setTitle:COLOR_PALETTE_NAME[segmentIndex] forSegmentAtIndex:segmentIndex];
    [self.segmentedTextColor setTitle:COLOR_PALETTE_NAME[segmentIndex] forSegmentAtIndex:segmentIndex];
  }

  [self updateLabels];
}

-(void)updateLabels
{
  self.labelText.text = self.theLabel.text;
  self.labelShadowOffset.text = NSStringFromCGSize(self.theLabel.shadowOffset);
  self.labelShadowColor.text = [self.theLabel.shadowColor description];
  self.labelTextColor.text = [self.theLabel.textColor description];
  self.labelFontName.text = self.theLabel.font.fontName;
  self.labelFontSize.text = [@(self.theLabel.font.pointSize) stringValue];
  self.labelFrame.text = NSStringFromCGRect(self.theLabel.frame);
  self.labelAlignmentRect.text = NSStringFromCGRect([self.theLabel alignmentRectForFrame:self.theLabel.frame]);
  self.labelIntrinsicSize.text = NSStringFromCGSize(self.theLabel.intrinsicContentSize);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleFontSizeStepped:(id)sender {
  UIStepper * stepper = (UIStepper*) sender;
  CGFloat newValue = stepper.value;

  UIFont * oldFont = self.theLabel.font;
  UIFont * newFont = [UIFont fontWithName:oldFont.fontName size:newValue];

  self.theLabel.font = newFont;
  [self updateLabels];
}

- (IBAction)handleShadowColor:(id)sender {
  UISegmentedControl * control = (UISegmentedControl*)sender;
  NSArray * colors = COLOR_PALETTE;
  id newcolor = colors[control.selectedSegmentIndex];
  self.theLabel.shadowColor = ([newcolor isEqual:[NSNull null]]) ? nil : (UIColor*)newcolor;
  [self updateLabels];
}

- (IBAction)handleTextColor:(id)sender {
  UISegmentedControl * control = (UISegmentedControl*)sender;
  NSArray * colors = COLOR_PALETTE;
  id newcolor = colors[control.selectedSegmentIndex];
  self.theLabel.textColor = ([newcolor isEqual:[NSNull null]]) ? nil : (UIColor*)newcolor;
  [self updateLabels];
}

- (IBAction)handleSizeToFit:(id)sender {
  [self.theLabel sizeToFit];
  [self updateLabels];
}

@end
