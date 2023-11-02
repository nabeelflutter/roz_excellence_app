class ForgetPasswordScreenEvents{
  const ForgetPasswordScreenEvents();
}

class SendEmailEvent extends ForgetPasswordScreenEvents{
  String email;


  SendEmailEvent({required this.email});

}