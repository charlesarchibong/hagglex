const String loginQuery = r'''
  mutation login($input: LoginInput!) {
  login(data: $input) {
    user{email, phonenumber}
    token
  }
}
''';
