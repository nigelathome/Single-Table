//
//  NameAndColorCell.m
//  Single Table
//
//  Created by Nigel Lee on 16/8/23.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell ()

@property (strong, nonatomic) IBOutlet UILabel  *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *colourLabel;

@end

@implementation NameAndColorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setName:(NSString *)name {
    if (![name isEqualToString:_name]) {
        _name = [name copy];
        self.nameLabel.text = _name;
    }
}

- (void)setColour:(NSString *)colour {
    if (![colour isEqualToString:_colour]) {
        _colour = [colour copy];
        self.colourLabel.text = _colour;
    }
}

@end
