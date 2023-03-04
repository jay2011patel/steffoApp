class User{
  //User(){}
  String? first_name,last_name,email,password,mobile_num,user_type;

  toJson(){
    var jsonObj = {
    "firstName":this.first_name,
    "lastName":this.last_name,
    "email":this.email,
    "password":this.password,
    "mobileNumber":this.mobile_num,
    "userType":this.user_type,
    };
  }

}