//
//  TipViewController.m
//  Tipster
//
//  Created by abenezermolla on 6/22/21.
//

#import "TipViewController.h"

// below is the property section which defines the outlets that I will use throughout the code.
//each of the outlets are connected to the objects in mainStoryBoard.
// Tip for anyone looking at the code: simply hovering the mouse over the black-dots the right of each property tells which objects they're connected to.

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField; // for the textField object that accepts the total bill amount from user
@property (weak, nonatomic) IBOutlet UILabel *tipLable; // displays the tip; doesn't accept input from user.
@property (weak, nonatomic) IBOutlet UILabel *totalLable;// displays total; doesn't accept input from user.
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;// think of this as radiobuttons of 3(15%, 20%, 25%), that will let the user to change from one to another percentage
@property (weak, nonatomic) IBOutlet UIView *lablesContainerView2; // needed to wrap the two lables anfd the Segmented control and animate them all at once instead of animating each of the objects separatly.

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onTap:(id)sender {
    
    NSLog(@"Hello"); // Just for debuggin purpose. To see if the function is working by tapping anywhere on the app.
    [self.view endEditing:true]; // when the app screen is tapped, the keyboard will disapear.
}
- (IBAction)updateLables:(id)sender {
    
    
    
    if(self.billField.text.length==0){
        // when the user deletes the bill input and makes it empty space, the 'hideLables' method will be called.
        [self hideLables];
    } else{
        // if the bill input section is not empty, 'showLables' method will be called.
        
        [self showLables];
    }
    
    
    
    double tipPercentages[] = {0.15, 0.2, 0.25}; //array of percentages
    
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    // chooses from the three array elements above by indexing through the array using the selectSgementIndex(the index associated with the UISegmentedControl the user decides to pick.)
    
    double bill = [self.billField.text doubleValue]; //change it into double because strings will not be used for math oprations
    
    double tip = bill* tipPercentage; //  my tip will be the bill multiplied by whatever is the tipPercetage selected from 0.15, 0.2, and 0.25.
    
    double total = tip + bill;
    
    
    
    self.tipLable.text = [NSString stringWithFormat:@"$%.2f", tip];
    
    
    
    self.totalLable.text = [NSString stringWithFormat:@"$%.2f", total];;
    
    //in both of the above cases, I needed to change them back to string to be able to display them(attach them) to the tip Lable and total Lable I have created in MainStoryBoard(and later connected to their respective outlet properties.)
    
    
}


// the 'hideLables' function below is going to be excuted if the 'if statement I had above is true.'



-(void) hideLables{
    
    // notice how the code is wrapped in between the [UIView animateWithDuration ...]. This helps to make sure the animation applies to the two frames I created and set to move around in y-axis.
    
    [UIView animateWithDuration:0.5 animations:^{
        
        
         CGRect billFrame  = self.billField.frame; // creates billFrame
        
         
             
             billFrame.origin.y+=150; // move it +150 in the y axis everytime the billField is empty.
             
             self.billField.frame = billFrame; // set the new billField.frame to billFrame so that the changes can be applied.
         
         CGRect lablesFrame = self.lablesContainerView2.frame; // creating a lablesFrame that wraps the two lables and the UISegementedControls.
         
         lablesFrame.origin.y +=150; // move this wrapping container +150 in the y axis whenever the billField is empty.
         
            self.lablesContainerView2.frame = lablesFrame; // set the lables.ContainerView2.frame to be the lablesFrame to apply changes.
        
      
        
    }];
    
}
    




    
    
// the method below runs if the 'if statement' is not True. In other words, if the billsField is not empty.

// The method below has the opposite use of the hideLables method right above.

// I needed an 'else' statement and created this method becuase the frame was moving down whenever the bills field was getting emptied. And after emptying it for 3 or 4 times, the frames will go out of screen. So I decided to add this function to smoothly counter-balance the downward movement of frames while animating.

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
