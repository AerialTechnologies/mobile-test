# Aerial - Technical Mobile Test
​
## Run the project
​
- Fork the project from `https://github.com/AerialTechnologies/mobile-test`
- Run `flutter pub get`
- Run `flutter run` or from vscode `fn + f5`
​
### Trap list
​
- The cmd flutter is not working: your flutter sdk path is not exported or is not the good one
- Your app doesn't work well: clean your build cache with `flutter clean`
- Something went wrong with your XCode or iOS simulator:
  - Your XCode or simulator is not up to date
  - On XCode, check your provisioning profile, it should be `none`
  - On XCode, check your signing bundle identifier, it should be `ai.aerial.rca`
​
## Let's start
​
- You have two hours to finish the tasks below
- Don't worry if everything is not complete at the end
- Before starting we have max 30 minutes with us to:
  - Point on this test
  - Provide you an overview of the code
  - Ask any question you have in mind about the code or the exercise
- After this first period, we will let you work:
  - Google should be your best friend if you have question
  - Feel free to let us know if you are blocked, we will help you
​
Now the rules are defined, let's complete the tasks.
​
## Let's work
​
The objective of this test is to implement the home screen from [Figma](https://www.figma.com/file/5JETGT5KzzNNMvRlCvXnEG/Aerial-Mobile-test?node-id=0%3A1)
​
### Information
​
- account_email: provided by Loïc
- account_password: provided by Loïc
- serial: `80029C3D4C21`
- group_id: `f0ba8cf5-425a-450d-889d-bab19a9a625e`
​
- To know if the house is active or not use the endpoint `GET /group/{group_id}/activity/isActive`
- The success payload you will receive should be:
​
```JSON
{
  "code": Int,
  "type": String,
  "isActive": bool
}
```
​
- The error payload you will receive should be:
​
```JSON
{
  "code": Int,
  "message": String,
  "type": String,
  "subtype": String
}
```
​
### Helper
​
- Every asset needed are available in `/assets/`
- Provide a responsive page, use `/plugins/responsive/`
- Don't forget, you already have some information in the description
​
### Clean
​
- Feel free to change/enhance any part of the existing code.
- Feel free to clean the code format, type, ...
​
### Integration
​
1. Header:
​
- The header section must be in the top fixed position
- As shown in the Figma layouts, the header section has two possible states selected by the `isActive` status
- The state should be updated every 5 seconds
- In case of error, just print a relevant debug message in the console
​
2. Cards:
​
- The card list must be scrollable
- Every change of the `isActive` value should trigger a new card that includes the associated timestamp
- The state should be verified every 5 seconds
- In case of error, just print a relevant debug message in the console