//
//  ViewController.m
//  Single Table
//
//  Created by Nigel Lee on 16/8/22.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (copy, nonatomic) NSArray *dwarves;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // in real industry environment, the dwarves likely comes from Server by means of JSON or ProtoBuff(PB)
    self.dwarves = @[@"Sleepy", @"Sneezy", @"Bashful", @"Happy",
                                    @"Doc", @"Grumpy", @"Dopey",
                                    @"Thorin", @"Dorin", @"Nori", @"Ori",
                                    @"Balin", @"Dwalin", @"Fili", @"Kili",
                                    @"Oin", @"Gloin", @"Bifur", @"Bofur",
                                    @"Bombur"];
    UITableView *tableView = (id)[self.view viewWithTag:1];
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
    return [self.dwarves count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:SimpleTableIdentifier];
    }
    
    UIImage *image = [UIImage imageNamed:@"star"];
    cell.imageView.image = image;
    
    cell.textLabel.text = self.dwarves[indexPath.row];
    if (indexPath.row < 7) {
        cell.detailTextLabel.text = @"Mr. Disney";
    } else {
        cell.detailTextLabel.text = @"Mr. Tolkien";
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row;
}

#pragma mark -delegate
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return nil;
    } else {
        return indexPath;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *rowValue = [[NSString alloc] initWithFormat:@"%@", self.dwarves[indexPath.row]];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected: %@", rowValue];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Row Selected!" message:message preferredStyle:UIAlertControllerStyleAlert
                                ];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Yes, I Did."
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil
                             ];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
