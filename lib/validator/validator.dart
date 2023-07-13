import 'package:form_field_validator/form_field_validator.dart';

class Validator {
  static MultiValidator emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter email'),
    PatternValidator(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
        errorText: 'Enter valid email address')
  ]);

  static MultiValidator passValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter password'),
    MinLengthValidator(6, errorText: 'Enter atleast 6 digit password'),
    // PatternValidator(
    //     "r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}",
    //     errorText: "please enter vaild password")
  ]);

  static final nameValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter name'),
  ]);

  static final cityValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter city name'),
  ]);

  static final stateValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter  state name'),
  ]);

  static final countryValidator = MultiValidator([
    RequiredValidator(errorText: 'Please enter country name'),
  ]);
}
