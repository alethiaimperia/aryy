import UIKit
import Flutter
import GoogleMaps  // For Google Maps view

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // TODO: Add your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyA8RyACGe2hu1UmrJYmxvCsEw760gy4mbM")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
