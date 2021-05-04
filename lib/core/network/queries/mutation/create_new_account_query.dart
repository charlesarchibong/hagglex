const String registerQuery = r'''
  mutation register($input: CreateUserInput!) {
  register(data: $input) {
    user{email, phonenumber}
    token
  }
}
''';
