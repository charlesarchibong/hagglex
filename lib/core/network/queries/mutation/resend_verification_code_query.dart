const String resentCodeQuery = r'''
  mutation resendVerificationCode($input: EmailInput!) {
  resendVerificationCode(data: $input) {
   done
  }
}
''';
