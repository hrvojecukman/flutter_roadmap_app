# login_template_firebase

A new Flutter project.

## Getting Started

1. Clone this project
2. Install firebase with Firebase CLI - (https://firebase.google.com/docs/cli#install-cli-mac-linux)
   1. MacOS: curl -sL https://firebase.tools | bash
   2. dart pub global activate flutterfire_cli
   3. Ako trazi ovo: export PATH="$PATH":"$HOME/.pub-cache/bin"
   4. Onda ponovno dart pub global activate flutterfire_cli
   5. firebase login
   6. flutterfire configure
    
3. await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
   );
   
4. Setup firebase_auth
    iOS
    1. Add GoogleServiceInfo.plist (iOS)
    2. Add your REVERSED_CLIENT_ID to Info.plist
    
    Android   
    1. You do need to enable the OAuth APIs that you want, using the Google Cloud Platform API 
    

