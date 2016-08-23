//
//  NameAndColorCell.m
//  Single Table
//
//  Created by Nigel Lee on 16/8/23.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "NameAndColorCell.h"

@interface NameAndColorCell ()

@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *colourLabel;

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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        CGRect nameLabelRect = CGRectMake(0, 5, 70, 15);
        UILabel *nameMarker = [[UILabel alloc] initWithFrame:nameLabelRect];
        nameMarker.textAlignment = NSTextAlignmentRight;
        nameMarker.text = @"Name:";
        nameMarker.font = [UIFont boldSystemFontOfSize:12.f];
        [self.contentView addSubview:nameMarker];
        
        CGRect colourLabelRect = CGRectMake(0, 26, 70, 15);
        UILabel *colourMarker = [[UILabel alloc] initWithFrame:colourLabelRect];
        colourMarker.textAlignment = NSTextAlignmentRight;
        colourMarker.text = @"Colour:";
        colourMarker.font = [UIFont boldSystemFontOfSize:12.f];
        [self.contentView addSubview:colourMarker];
        
        CGRect nameValueRect = CGRectMake(80, 5, 200, 15);
        _nameLabel = [[UILabel alloc] initWithFrame:nameValueRect];
        [self.contentView addSubview:_nameLabel];
        
        CGRect colourValueRect = CGRectMake(80, 5, 200, 15);
        _colourLabel = [[UILabel alloc] initWithFrame:colourValueRect];
        [self.contentView addSubview:_colourLabel];
    }
    return self;
}

@end
