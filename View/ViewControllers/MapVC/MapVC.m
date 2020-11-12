//
//  MapVC.m
//  FreeNow
//
//  Created by Mughees Mustafa on 09/11/2020.
//

//@class PoiPresenter;
#import "MapVC.h"
#import <GoogleMaps/GoogleMaps.h>
#import "FreeNow-Swift.h"


@interface MapVC () <PoiDelegate, GMSMapViewDelegate>{

    PoiService* poiService;

    PoiPresenter* presenter;
    NSMutableArray *poiArray;
    GMSMapView *mapView;
    GMSGeocoder *geocoder;


}

@end

@implementation MapVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    self.presenter = Presen
    self.title = @"MapVC";
    
    poiArray = [[NSMutableArray alloc] init];

    
    poiService = [[PoiService alloc] init];
    
    presenter = [[PoiPresenter alloc] initWithPoiService:poiService];
    
    [presenter setViewDelegateWithPoiDelegate:self];
    
    
    [self mapSetUp];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)mapSetUp {
   
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:53.57915395123425
                                                              longitude:9.976214244961739
                                                                   zoom:14];
    mapView = [GMSMapView mapWithFrame:self.view.frame camera:camera];
//    mapView.myLocationEnabled = YES;
    mapView.delegate = self;
    [self.view addSubview:mapView];

     
    
    
}

- (void)setMarkers{
    
    
    for (id object in poiArray) {

        
        PoiList *obj = object;
        
        Coordinate *coordinate = obj.coordinate;
        
        GMSMarker *marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude);
        marker.icon = [UIImage imageNamed:@"Taxi"];

//        marker.title = [NSString stringWithFormat: @"%ld", (long)obj.id];
        marker.title = obj.type;
        marker.snippet = obj.state;
        marker.map = mapView;
    }
    

    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - POIPresenterDelegate


- (void)displayTaxisWithPoiList:(NSArray<PoiList *> * _Nonnull)poiList {
    
    
    poiArray = poiList;
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [self setMarkers];
             
    });
    
    
}

- (void)showErrorAlertWithDescription:(NSString * _Nonnull)description {
    
    [self showErrorAlertWithDescription:description];
}

#pragma mark - GMSMapViewDelegate


- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture {
 
    [mapView clear];
}
- (void)mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)cameraPosition {
 
    
    [presenter fetchPoiList];

}

@end
