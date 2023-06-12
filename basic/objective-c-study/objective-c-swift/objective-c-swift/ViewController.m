//
//  ViewController.m
//  objective-c-swift
//
//  Created by jiinheo on 2022/06/19.
//

#import "ViewController.h"
#import "objective_c_swift-Swift.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *nextButton;
@property (strong, nonatomic) Test *test;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupUI];
    
    _test = [Test new];
    [_test hiWithName:@"jiin"];
    
//    NSString *stringValue = [[Test.MyEnum valueForKey:@"case1"] stringValue];
    
//    MyEnum2 test1 = MyEnum2CaseA;
//    NSString *stringValue = @(test1).name;
//    NSString *stringValue2 = @(test1).stringValue;
//    NSLog(@"test = %@, %@", stringValue, stringValue2);
//
//    NSString *description = [MyEnum2CaseA valueForKey:@"description"];
//    NSLog(@"%@", description); // "Case 1"
    
//    MyEnum2 myEnum2 = MyEnum2CaseA;
//    NSString *stringValue = [myEnum2 stringValue];
    
//    NSString *asdf = [test1 description];
//    NSString *asdf = test1.description;
//    NSString *stringValue = [myEnum2 stringValue];

    
//    NSString *stringVa = MyEnumCase1.stringValue;
    
//    NSString *stringValueForCase1 = [MyEnum stringValueForCase:MyEnumCase1];
    
//    NSString *stringValue = [SwiftBridge stringValueForMyEnumCase1];
//    NSLog(@"%@", stringValue);
}

- (void)setupUI {
    [self.view addSubview:self.label];
    [self.view addSubview:self.nextButton];
}

- (void)buttonClick{
    NSLog(@"~~~~~~ test~~~~~~");
    TestVC *vc = [TestVC new];
    [self.navigationController pushViewController:vc animated:true];
}

- (UILabel*) label {
    if (_label == nil) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
        _label.text = @"안녕 난 옵젝씨야 :)";
        _label.font = [UIFont systemFontOfSize:20 weight:bold];
        _label.textColor = UIColor.blackColor;
    }
    return _label;
}

- (UIButton*) nextButton {
    if (_nextButton == nil) {
        _nextButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 200)];
        [_nextButton setTitle:@"옵젝씨 -> 스위프트" forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        _nextButton.backgroundColor = UIColor.blueColor;
    }
    return _nextButton;
}

@end
