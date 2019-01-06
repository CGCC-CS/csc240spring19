#include<iostream>

using namespace std;

class myClass {
  public:
    int *a;
  private:
    int b;

  public:
    // Constructor
    myClass(int x) {
      static int counter = 1;

      a = new int;
      *a = x;
      b = counter;
      counter++;
      cout << "  Constructor " << b << " : " << a << " (" << *a << ")" << endl;
    }

    // Copy constructor
    myClass(const myClass& original) {
      a = new int;
      *a = *(original.a);
      b = original.b * 10;
      cout << "  Copy Constructor " << b << " : " << a << " (" << *a << ")" << endl;
    }

    // Destructor
    ~myClass() {
      cout << "  Destructor " << b << " : " << a << " (" << *a << ")" << endl;
      delete a;
      a = nullptr;  
    }

    void print(string s) {
      cout << "  object " << b << " : " << a << " (" << *a << ")" << endl;
    }
};

void func(myClass k) {
  cout << "FUNC: ++++++++++++ start func ++++++++++++" << endl;
  cout << "FUNC: start" << endl;

  cout << "FUNC: begin declare c3" << endl;
  myClass c3(3);
  cout << "FUNC: end declare c3" << endl;

  cout << "FUNC: print k" << endl;
  k.print("k");
  cout << "FUNC: end k" << endl;

  cout << "FUNC: print c3" << endl;
  c3.print("c3");
  cout << "FUNC: end c3" << endl;

  cout << "FUNC: end" << endl;
  cout << "FUNC: +++++++++++++ end func +++++++++++++" << endl;
}

int main() {
  cout << "MAIN: start" << endl;
  cout << "MAIN: begin declare c1" << endl;
  myClass c1(1);
  cout << "MAIN: end declare c1" << endl;
  
  cout << "MAIN: begin declare c2" << endl;
  myClass * c2;
  cout << "MAIN: end declare c2" << endl;
  
  cout << "MAIN: begin instantiate c2" << endl;
  c2 = new myClass(2);
  cout << "MAIN: end instantiate c2" << endl;
 
  cout << "MAIN: begin call func()" << endl;
  func(c1);
  cout << "MAIN: end call func() c2" << endl;
 
  cout << "MAIN: begin delete c2" << endl;
  delete c2;
  cout << "MAIN: end delete c2" << endl;
 
  cout << "MAIN: exiting" << endl;
  return 0;
}
