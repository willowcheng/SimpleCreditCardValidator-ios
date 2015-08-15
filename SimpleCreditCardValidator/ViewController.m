

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *creditCardNumberText;
@property (weak, nonatomic) IBOutlet UIButton *validateCreditCardButton;
@property (weak, nonatomic) IBOutlet UILabel *errorMessageLabel;
- (IBAction)validateCreditCardHandler:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated {
	    _errorMessageLabel.text = @"";
    _creditCardNumberText.text= @"";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)validateCreditCardHandler:(id)sender {
    NSString *enteredText = [_creditCardNumberText text];
    
    long length = [enteredText length];
    
    if (length == 0) {
        _errorMessageLabel.text = @"This is not a credit card number.";
        return;
    }
    if (length < 16) {
        _errorMessageLabel.text =@"Credit card number is too short.";
        return;
    }
    if (length > 16) {
        _errorMessageLabel.text = @"Credit card number is too long.";
        return;
    }
    
    if (length == 16) {
        _errorMessageLabel.text = @"";
        
        NSString *storyboardId = @"ValidCreditCardController";
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:storyboardId];

        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    

    _errorMessageLabel.text = @"Unknown error!";
    
 }
@end
