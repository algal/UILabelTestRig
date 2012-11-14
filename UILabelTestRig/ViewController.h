//
//  ViewController.h
//  UILabelTestRig
//
//  Created by Alexis Gallagher on 2012-11-13.
//  Copyright (c) 2012 Foxtrot Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *theLabel;

// labels to show property values
@property (weak, nonatomic) IBOutlet UILabel *labelText;
@property (weak, nonatomic) IBOutlet UILabel *labelShadowOffset;
@property (weak, nonatomic) IBOutlet UILabel *labelShadowColor;
@property (weak, nonatomic) IBOutlet UILabel *labelTextColor;
@property (weak, nonatomic) IBOutlet UILabel *labelFontName;
@property (weak, nonatomic) IBOutlet UILabel *labelFontSize;
@property (weak, nonatomic) IBOutlet UILabel *labelFrame;
@property (weak, nonatomic) IBOutlet UILabel *labelAlignmentRect;
@property (weak, nonatomic) IBOutlet UILabel *labelIntrinsicSize;

// controls to alter the label
@property (weak, nonatomic) IBOutlet UIStepper *stepperFontSize;
- (IBAction)handleFontSizeStepped:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedShadowColor;
- (IBAction)handleShadowColor:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedTextColor;
- (IBAction)handleTextColor:(id)sender;

- (IBAction)handleSizeToFit:(id)sender;
@end
