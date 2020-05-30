# Aerial Mobile App Test

## Let's setup

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
  - On XCode, check your provisioning profile, it should be `none`
  - On XCode, check your signing bundle identifier, it should be `ai.aerial.rca`

## Let's start

- You have one hour to finish the tasks below
- Don't worry if everything is not complete at the end
- Before starting we let you 10 minute with us to:
  - Make an overview of the code
  - Ask any question you have in mind about the code or the exercice
- After this first period of 10 minutes, we will let you work:
  - Google should be your best friend if you have question
  - Feel free to indicate your are blocked, we will help you

Now the rules are defined, let's complete the tasks.

## Let's work

The target of this test is to implement the home screen from [Figma](https://www.figma.com/file/5JETGT5KzzNNMvRlCvXnEG/Aerial-Mobile-test?node-id=0%3A1)

### Information

- account_email: `mobile.test.hiring@aerial.ai`
- account_password: provided by Loïc
- serial: `80029C3D4C21`
- group_id: `f0ba8cf5-425a-450d-889d-bab19a9a625e`

- To know if the house is active or not use the endpoint `GET /group/{group_id}/activity/isActive`
- The success payload you will receive should be:

```JSON
{
  "code": Int,
  "type": String,
  "isActive": bool
}
```

- The error payload you will receive should be:

```JSON
{
  "code": Int,
  "message": String,
  "type": String,
  "subtype": String
}
```

### Helper

- Every assets needed are available in `/assets/`
- Provide a responsive page, use `/plugins/responsive/`
- Don't forget, you already have some informations in the description

### Clean

- Feel free to change/enhance any part of the existing code.
- Feel free to clean the code format, type, ...

### Integration

1. Header:

- The header part should be in a top fixed position
- The elements should react according the `isActive` status
- The response should be updated every 5 seconds
- In case of error, just print a consistent debug in your console

2. Cards:

- The card list should be scroll
- Every `isActive` changement should create a new card with the timestamp
- The response should be updated every 5 seconds
- In case of error, just print a consistent debug in your console
