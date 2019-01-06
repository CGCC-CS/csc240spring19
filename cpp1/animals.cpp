#include<iostream>
#include<string>

using namespace std;

class Animal {
  protected:
    string n;

  public:
    Animal(string s="NoName") {n=s;}   // Default value = "NoName"

    // Pure virtual method - must be overridden by any non-abstract
    // derrived class;
    virtual void speak() = 0;

    // Virtual method - can be overridden by the child class.  The type of
    // the *object* being pointed to determines the method that gets called.
    virtual void move() { cout << "ANIMAL: I'm moving!" << endl; }

    // Not-virtual method - can be overridden by the child class.
    // The type of the *pointer* determines the method that gets called.
    void eat() { cout << "ANIMAL: I'm hungry!" << endl; }
};

class Dog : public Animal {
  public:
    Dog(string s="Dog") : Animal(s) {}

    void speak() { cout << n << ": Woof!" << endl; }

    void move() { cout << n << ": Run around!" << endl; }

    void fetch() { cout << n << ": Ball! Ball!" << endl; }
};

class Cat : public Animal {
  public:
    Cat(string s="Cat") : Animal(s) {}

    void speak() { cout << n << ": Meow!" << endl; }
};

int main() {
  //Animal a;  // Cannot instantiate an Animal

  Dog d("Scruffy");
  Dog *dptr;
  Dog &dogRef = d;

  Cat c("Spinkles");
  Cat *cptr;
  Cat &catRef = c;
  
  Animal *danimal, *canimal;

  /* Cannot instantiate an abstract class 
  cout << endl << "Animal object: " << endl;
  a.speak();
  a.move(); 
  a.eat();
  */
 
  /* Cannot instantiate an abstract class 
  cout << endl << "Animal pointer to an animal object" << endl;
  aptr = new Animal("Anotherone");
  aptr->speak();
  aptr->move(); 
  aptr->eat();
  */

  cout << endl << "Dog object: " << endl;
  d.speak();
  d.move(); 
  d.eat();
  d.fetch();

  cout << endl << "Dog pointer to an dog object" << endl;
  dptr = new Dog("Rover");
  dptr->speak();
  dptr->move(); 
  dptr->eat();
  dptr->fetch();

  cout << endl << "Dog reference: " << endl;
  dogRef.speak();
  dogRef.move(); 
  dogRef.eat();
  dogRef.fetch();

  cout << endl << "Animal pointer to an dog object" << endl;
  danimal = dptr;
  danimal->speak();
  danimal->move(); 
  danimal->eat();
  //danimal->fetch();  // Animals don't know how to fetch!

  cout << endl << "Animal reference to dog: " << endl;
  Animal & animalRef = d;
  animalRef.speak();
  animalRef.move(); 
  animalRef.eat();

  cout << endl << "Cat object: " << endl;
  c.speak();
  c.move(); 
  c.eat();

  cout << endl << "Cat pointer to an cat object" << endl;
  cptr = new Cat("Snowball");
  cptr->speak();
  cptr->move(); 
  cptr->eat();

  cout << endl << "Cat reference: " << endl;
  catRef.speak();
  catRef.move(); 
  catRef.eat();

  cout << endl << "Animal pointer to an cat object" << endl;
  canimal = cptr;
  canimal->speak();
  canimal->move(); 
  canimal->eat();
  return 0;
}
