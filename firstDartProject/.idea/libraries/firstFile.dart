class Manager{

  String? firstName;
  String? lastName;

Manager(String a, String b){
   this.firstName = a;
   this.lastName = b;
}



printName(){
  print("First Name is : $firstName");
  print("Last Name is : $lastName");
}

//function with a default value;
void PlusFunc(int a, {int b = 20}){
  print(a + b);
}

//function with optional positional parameter.
void printCityNames(String a, String b , [String? c]){
  print("First City is : $a");
  print("Second City is : $b");
  print("Third City is : $c");
}

void managerDetails(String name, {int age, String? email, String? city}){
  print("Name is : $name");
  print("Age is : $age ");
  print("Email is : $email");
  print("City is : $city");
  }
}
void main(){

  Manager mng = new Manager("Asad", "Yaqoob");
  // mng.printName();
  // mng.PlusFunc(10, b:5);
  // mng.printCityNames("Karachi", "Lahore");
  mng.managerDetails("Asad",age: 59,city: Karchi,email: abc@gmail.com);
}