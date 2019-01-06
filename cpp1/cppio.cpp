#include<iostream>
#include<string>

int main() {
  int count;
  std::string str;

  std::cout << "Enter a number: ";
  std::cin >> count;

  std::cout << "Enter a word: ";
  std::cin >> str;  // Note - this only gets characters until the next whitespace
  std::getline(std::cin, str);  // Clear the input

  for (int ii=0;ii<count;ii++) {
    std::cout << ii+1 << " : " << str << std::endl;
  }
 

  std::cout << std::endl;
  std::cout << "Enter a string: ";
  std::getline(std::cin, str);

  for (int ii=0;ii<count;ii++) {
    std::cout << ii+1 << " : " << str << std::endl;
  }

  return 0;
}
