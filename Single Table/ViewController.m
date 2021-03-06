//
//  ViewController.m
//  Single Table
//
//  Created by Nigel Lee on 16/8/22.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"

static NSString *cellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()
@property (copy, nonatomic) NSArray *dwarves;
@property (copy, nonatomic) NSArray *computers;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // in real industry environment, the dwarves likely comes from Server by means of JSON or ProtoBuff(PB)
    self.computers = @[@{@"Name" : @"MacBook Air", @"Color" : @"Silver"},
                       @{@"Name" : @"MacBook Pro", @"Color" : @"Silver"},
                       @{@"Name" : @"iMac", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac Mini", @"Color" : @"Silver"},
                       @{@"Name" : @"Mac Pro", @"Color" : @"Black"}];
    UITableView *tableView = (id)[self.view viewWithTag:1];
    
    tableView.rowHeight = 65;
    UINib *nib = [UINib nibWithNibName:@"NameAndColorCell" bundle:nil];
    
    [tableView registerNib:nib forCellReuseIdentifier:cellTableIdentifier];

    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 20;
    [tableView setContentInset:contentInset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NameAndColorCell *cell = [tableView dequeueReusableCellWithIdentifier:cellTableIdentifier
                                                             forIndexPath:indexPath];
    NSDictionary *rowData = self.computers[indexPath.row];
    cell.name = rowData[@"Name"];
    cell.colour = rowData[@"Color"];
    
    return cell;
}

#pragma mark -delegate

@end
