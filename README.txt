For information about how the prerequisites for using Facebook SSO (Single Sign On) see:
https://developers.facebook.com/docs/mobile/ios/build/#sdk 

This project is meant for showing how to create a Facebook Singleton Manager
to encapsulate most Facebook related code in one place.

The important code is at MFFacebookManager.
An example of how to use the manager is at MFViewController.m.

Please notice the following:
1. At the Application delegate make sure you implement - (BOOL)application: openURL: sourceApplication:
   Like shown on the Demo project.
2. Make sure you set a new URL Scheme at the info.plist URL Types.
3. Enjoy. 
 

