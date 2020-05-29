# Aerial Mobile App Test

## Let's start

### Project install

- Fork the project from `https://github.com/AerialTechnologies/mobile-test`
- Install Flutter and env tool according your OS from flutter doc
- Setup you editor from flutter doc
- Test all you setup by running flutter doctor

## Run the project

- Run `flutter pub get`
- Run `flutter run` or from vscode `fn + f5`

### Trap list

- The cmd flutter is not working: you flutter sdk path is not exported or is not the good one
- Your app doesn't work well: clean your build cached with flutter clean
- Something went wrong with your XCode or iOS simulator:
    - Your XCode or simulator is not up to date
    - On XCode, check your signing team, it should be Aerial Technologies Inc.
    - On XCode, check your signing bundle identifier, it should be ai.aerial.remotecare

### App test info

account_user: `mobile.test.hiring@gmail.com`
account_password: provide by Loïc
serial: `80029C3D4C21`
group_id: `f0ba8cf5-425a-450d-889d-bab19a9a625e`

## Let's work

### Rules

- You have one hour to finish the tasks below
- Don't worry if everything is not complete at the end
- Before starting we let you 10 minute with us to:
    - Make a quick overview of the code
    - Ask any question you have in mind about the code or the exercice
- After this first period of 10 minutes, we will let you work:
    - Google should be your best friend if you have question
    - Feel free to indicate that your are block, we will help you

Now the rules are defined, let's complete the tasks.

### 1. Clean

- Feel free to change/enhance any part of the existing code.
- Feel free to clean the code format, type, ...

### 2. Implement

- Implement the home screen provided:
    - Every assets needed are available in `/assets/`
    - Provide a responsive page, use `/plugins/responsive/`

### 3. Go further

- Implement the endpoint `GET /house/isActive`:
    - The payload received should be: ,
    - handle the response