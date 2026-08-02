/// Shared form validation for the authentication views.
///
/// Keeps email rules identical between the sign-in and sign-up forms so the
/// two views cannot drift apart — both must accept and reject the same
/// inputs.
String? validateEmail(String? value) {
  final email = value?.trim() ?? '';
  if (email.isEmpty) return 'Please enter your email';
  if (!email.contains('@') || !email.contains('.')) {
    return 'Please enter a valid email';
  }
  return null;
}
