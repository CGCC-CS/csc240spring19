#include<iostream>
#include<iterator>
#include<string>
#include<map>

using namespace std;

int main() {
  map<string, int> grades;

  grades.insert(pair<string, int>("Bruce", 84));
  grades.insert(pair<string, int>("Rachel", 98));
  grades.insert(pair<string, int>("Liam", 95));
  grades.insert(pair<string, int>("Jackson", 90));
  grades.insert(pair<string, int>("Anna", 92));

  map<string, int>::iterator itr;
  for(itr=grades.begin(); itr != grades.end(); itr++) {
    cout << itr->first << " " << itr->second << endl;
  }

  // Delete Jackson's grade
  int gradeCount = grades.erase("Jackson");
  cout << endl << "Removed " << gradeCount << " grades" << endl;
  
  cout << endl << "Remaining grades:" << endl;
  for(itr=grades.begin(); itr != grades.end(); itr++) {
    cout << itr->first << " " << itr->second << endl;
  }
  
  return 0;
}
