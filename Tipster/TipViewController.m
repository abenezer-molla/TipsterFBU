//
//  TipViewController.m
//  Tipster
//
//  Created by abenezermolla on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLable;
@property (weak, nonatomic) IBOutlet UILabel *totalLable;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *lablesContainerView2;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    
    NSLog(@"Hello");
    [self.view endEditing:true];
}
- (IBAction)updateLables:(id)sender {
    
    
    
    if(self.billField.text.length==0){
        
        [self hideLables];
    } else{
        
        
        [self showLables];
    }
    
    double tipPercentages[] = {0.15, 0.2, 0.25};
    
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    double bill = [self.billField.text doubleValue];
    
    double tip = bill* tipPercentage;
    
    double total = tip + bill;
    
    
    
    self.tipLable.text = [NSString stringWithFormat:@"$%.2f", tip];
    
    
    
    self.totalLable.text = [NSString stringWithFormat:@"$%.2f", total];;
    
    
}

-(void) hideLables{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
         CGRect billFrame  = self.billField.frame;
         
             
             billFrame.origin.y+=150;
             
             self.billField.frame = billFrame;
         
         CGRect lablesFrame = self.lablesContainerView2.frame;
         
         lablesFrame.origin.y +=150;
         
            self.lablesContainerView2.frame = lablesFrame;
        
      
        
    }];
    
}
    




    
    
    

-(void) showLables{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
         CGRect billFrame  = self.billField.frame;
         
             
             billFrame.origin.y -= 10 ;
             
             self.billField.frame = billFrame;
         
         CGRect lablesFrame = self.lablesContainerView2.frame;
         
         lablesFrame.origin.y -=10;
         
            self.lablesContainerView2.frame = lablesFrame;
        
      
        
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
