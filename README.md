# AdMob and Facebook Mediation in Flutter

This Flutter project demonstrates the integration of Google AdMob and Facebook Audience Network mediation. The code configures ad networks and shows how to implement both banner and interstitial ads using mediation.

## Features

- **AdMob Integration**: Display ads using Google AdMob.
- **Facebook Audience Network Mediation**: Mediate Facebook ads through AdMob.
- **Ad Formats**:
  - Banner Ads
  - Interstitial Ads

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have Flutter installed on your system. [Install Flutter](https://docs.flutter.dev/get-started/install)
- **AdMob Account**: Create an account on [Google AdMob](https://admob.google.com/).
- **Facebook Audience Network Account**: Register and create ad placements on [Facebook Audience Network](https://www.facebook.com/audiencenetwork/).
- **AdMob App ID and Ad Unit IDs**: Obtain these from your AdMob dashboard.
- **Facebook Placement IDs**: Obtain these from your Facebook Audience Network dashboard.

### Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/DineshWayaman/Admob-Facebook-Mediation.git
   cd Admob-Facebook-Mediation
   ```

2. **Add Required Dependencies**:
   Open `pubspec.yaml` and add the following dependencies:
   ```yaml
   dependencies:
     google_mobile_ads: ^2.0.0
   ```
   Run the command:
   ```bash
   flutter pub get
   ```

3. **AdMob and Facebook Configuration**:
   - Add your AdMob App ID in the `AndroidManifest.xml` file:
     ```xml
     <meta-data
         android:name="com.google.android.gms.ads.APPLICATION_ID"
         android:value="YOUR_ADMOB_APP_ID"/>
     ```
   - Integrate Facebook mediation in the AdMob dashboard.
   - Download the Facebook Audience Network SDK and configure it in the `build.gradle` files as per the documentation.

5. **Run the App**:
   Execute the following command to run the app:
   ```bash
   flutter run
   ```

## Contact

For questions or support, please contact [dineshwayaman@gmail.com](mailto:dineshwayaman@gmail.com).
