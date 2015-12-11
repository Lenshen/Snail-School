//
//  PublishViewController.m
//  Snail School
//
//  Created by 远深 on 15/11/19.
//  Copyright © 2015年 himooo. All rights reserved.
//

#import "PublishViewController.h"
#import "UIView+LQXkeyboard.h"
#import "ZLPhotoPickerViewController.h"
#import "ZLCameraViewController.h"
#import "ZLCamera.h"
#define ScreenWidth self.view.bounds.size.width
#define ScreenHeight self.view.bounds.size.height

@interface PublishViewController ()<UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ZLPhotoPickerViewControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *pbCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *addImageButton;
@property (weak, nonatomic) NSArray *imagesArray;
@property (strong, nonatomic) NSMutableArray *imagesMutableArray;

@property (assign, nonatomic) CGRect keyboardField;
@property (assign, nonatomic)int i;


@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.i = self.addImageButton.frame.size.width;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    self.priceTextField.delegate = self;
    self.originalPrice.delegate =self;
    self.pbCollectionView.delegate =self;
    self.pbCollectionView.dataSource =self;
    
    

    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.imagesArray.count;

}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PBCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PBCollectionCell" forIndexPath:indexPath];
    NSLog(@"%ld",indexPath.row);
    ZLCamera *camera = self.imagesArray[indexPath.row];

   

    cell.GoodImage.image = camera.photoImage;
    return cell;
}

-(void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *useInfo = notification.userInfo;
    CGRect keyboardF = [useInfo[UIKeyboardFrameEndUserInfoKey]CGRectValue];
    self.keyboardField = keyboardF;
    self.view.tag = 3;

    [UIView animateWithDuration:1 animations:^{
               if (keyboardF.origin.y >self.view.height) {
//            self.priceView.y = self.view.height - self.priceView.height;
//                   self.priceView.y = keyboardF.origin.y - self.priceView.height;
            
        }else
        {
            self.priceView.y = keyboardF.origin.y - self.priceView.height;
        }
    }];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}
- (IBAction)addImage:(UIButton *)sender {
    self.i += 10;
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打开照相机",@"从手机相册获取", nil];
    actionSheet.tag = 1;
    [actionSheet showInView:self.view];


}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    actionSheet.tag = 1;
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        NSLog(@"cancel");
    }
    switch (buttonIndex) {
        case 0:
            [self takePhoto];
            break;
            case 1:
            [self localPhoto];
            break;
    
      
    }
}
-(void)takePhoto
{
//    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    picker.delegate = self;
//    picker.allowsEditing = YES;
//    [self presentViewController:picker animated:YES completion:nil];
    ZLCameraViewController *cameraVc = [[ZLCameraViewController alloc] init];
    __weak typeof(self) weakSelf = self;
    cameraVc.callback =  ^(NSArray *assets)
    {
        weakSelf.imagesArray =  assets;
        NSLog(@"assets %@",weakSelf.imagesArray);
        
        [self.pbCollectionView reloadData];
        
        
    };
    [cameraVc showPickerVc:self];

   

    

}
-(void)localPhoto
{
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    // 默认显示相册里面的内容SavePhotos
    pickerVc.status = PickerViewShowStatusCameraRoll;
    pickerVc.delegate = self;
    [pickerVc showPickerVc:self];
//    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
//        UIImagePickerController *prick = [[UIImagePickerController alloc]init];
//        prick.delegate = self;
//        prick.sourceType = sourceType;
//        [self presentViewController:prick animated:YES completion:nil];
//    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        NSData *data;
        if (UIImagePNGRepresentation(image)) {
            data = UIImageJPEGRepresentation(image, 1.0);
        }else
        {
            data = UIImagePNGRepresentation(image);
        }
        NSString *DocumnetsPath = [NSHomeDirectory()stringByAppendingPathComponent:@"Documents"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createDirectoryAtPath:DocumnetsPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createFileAtPath:[DocumnetsPath stringByAppendingString:@"/image.png"]  contents:data attributes:nil];
        NSString *filePath = [[NSString alloc]initWithFormat:@"%@%@",DocumnetsPath,@"/image.png"];
        [picker dismissViewControllerAnimated:YES completion:nil];
        UIImageView *smallimage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 210, 54, 61)];
        smallimage.image = image;
        [self.view addSubview:smallimage];
        
    }
}
- (IBAction)black:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    if (![self.originalPrice isExclusiveTouch]) {
//        [self.originalPrice resignFirstResponder];
//    }
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
