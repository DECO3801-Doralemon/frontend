import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldValidator {
  static String? validatePengisiData(String value) {
    if (value.isEmpty) {
      return '*Wajib diisi';
    } else {
      return null;
    }
  }

  static String? validateNamaPengisiData(String value) {
    if (value.isEmpty) {
      return '*Wajib diisi';
    } else {
      return null;
    }
  }

  static String? validateTtl(String value) {
    if (value.isEmpty) {
      return '*Wajib diisi';
    } else {
      return null;
    }
  }

  static String? validateAlamat(String value) {
    if (value.isEmpty) {
      return '*Wajib diisi';
    } else {
      return null;
    }
  }

  static String? validateEmail(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regex = RegExp(pattern);
    if (value.isEmpty) return '*This field cannot be empty';
    if (!regex.hasMatch(value)) {
      return '*Enter a valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return '*Wajib diisi';

    if (value.length < 8) {
      return '*Must have a least 8 characters';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String value) {
    var pattern = r'(^(?:[+0]9)?[0-9]{11,12}$)';
    var regExp = RegExp(pattern);
    if (value.isEmpty) {
      return '*Wajib diisi';
    } else if (!regExp.hasMatch(value)) {
      return '*Masukkan nomor telepon yang valid';
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) {
      return '*This field cannot be empty';
    } else {
      return 'Error';
    }
  }

  static String? validateInfo(String value) {
    if (value.isEmpty) {
      return '*Wajib diisi';
    } else {
      return null;
    }
  }

  static String? validateDropdown(String value) {
    if (value == null) {
      return '*Wajib diisi';
    } else {
      return null;
    }
  }

  static Widget? validateCustomFieldAlert(bool value) {
    return value
        ? Text('')
        : Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '*Minimal 1',
              key: Key('Alert Invalid Counter'),
              style: TextStyle(color: Colors.red, fontSize: 12.0),
            ),
          );
  }
}
