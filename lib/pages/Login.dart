import 'package:flutter/material.dart';

// INTERNAL
import 'package:rca/components/buttons.dart';
import 'package:rca/components/texts.dart';
import 'package:rca/models/user.dart';
import 'package:rca/plugins/responsive.dart';
import 'package:rca/singleton/auth.dart';
import 'package:rca/singleton/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AerialTheme().content.colors.base,
      body: Column(
        children: <Widget>[
          Container(
            height: 50 * Responsive.ratioVerticalMultiplier,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/splashscreen.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 5 * Responsive.ratioVerticalMultiplier,
              horizontal: 7 * Responsive.ratioHorizontalMultiplier,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            height: 50 * Responsive.ratioVerticalMultiplier,
            child: LoginForm(),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm();

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final UserSignIn _user = UserSignIn();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future _login() async {
    setState(() => _isLoading = true);

    if (_formKey.currentState.validate()) {
      bool successSignIn = await Auth().signIn(_user);

      if (successSignIn) {
        setState(() => _isLoading = false);
        Navigator.pushNamed(context, 'homePage');
      } else {
        setState(() => _isLoading = false);
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error connecting user, please contact Aerial.',
            ),
          ),
        );
      }
    } else {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              AerialInput(
                label: 'Email',
                onChanged: (String val) {
                  setState(() => _user.email = emailFormatter(val));
                },
                validator: UserSignInValidator().emailValidator,
              ),
              SizedBox(height: 2 * Responsive.ratioVerticalMultiplier),
              AerialInput(
                label: 'Password',
                inputType: InputType.password,
                onChanged: (String val) => setState(() => _user.password = val),
                validator: UserSignInValidator().passwordValidator,
              ),
            ],
          ),
          _isLoading
              ? CircularProgressIndicator()
              : AerialButton(
                  child: AerialButtonText('Sign in'),
                  onPressed: _login,
                ),
        ],
      ),
    );
  }
}

enum InputType { password, text }

class AerialInput extends StatefulWidget {
  final InputType inputType;
  final String label;
  final String initialValue;
  final Function onChanged;
  final Function validator;
  final bool capitalized;

  AerialInput({
    Key key,
    this.inputType,
    this.label,
    this.initialValue,
    this.capitalized = false,
    this.validator,
    @required this.onChanged,
  }) : super(key: key);

  @override
  _AerialInputState createState() => _AerialInputState();
}

class _AerialInputState extends State<AerialInput> {
  FocusNode _focusNode;
  bool _focused = false;
  bool _hideText = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
    _hideText = widget.inputType == InputType.password ? true : false;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() => _focused = _focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: _hideText,
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      initialValue: widget.initialValue,
      textCapitalization: widget.capitalized
          ? TextCapitalization.words
          : TextCapitalization.none,
      decoration: InputDecoration(
        errorMaxLines: 2,
        suffixIcon: IconButton(
          icon: widget.inputType == InputType.password
              ? Icon(
                  _hideText ? Icons.visibility_off : Icons.visibility,
                  size: 2.5 * Responsive.ratioVerticalMultiplier,
                  color: AerialTheme().content.colors.secondary,
                )
              : Container(),
          onPressed: () => setState(() => _hideText = !_hideText),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AerialTheme().content.colors.base,
          ),
        ),
        labelStyle: TextStyle(
          fontSize: 2 * Responsive.ratioVerticalMultiplier,
          color: _focused
              ? AerialTheme().content.colors.base
              : AerialTheme().content.colors.black,
        ),
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: widget.validator,
    );
  }
}
