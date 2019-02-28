#include<iostream>
#include<vector>
#include<algorithm>

using namespace std;
template<typename T> void printVector(vector<T> vec);

int main() {
  vector<int> v1(10);               // Create vector with capacity 10
  vector<int> v2 = {10, 20, 30};    // Initialize with an array
  vector<int> v3;                   // Default initialization
  vector<int> v4 = {8, 3, 1, 5, 12, 13, 2, 7, 10};  
  vector<double>::size_type vsize;  // size_type is an unsigned type that stores a size

  v1 = {1, 2, 3, 4};
  vsize = v1.size();

  // Vector size vs. capacity
  cout << "Vector v1 size: " << vsize << endl;
  cout << "Vector v1 capacity: " << v1.capacity() << endl;
  cout << "Vector v2 size: " << v2.size() << endl;
  cout << "Vector v2 capacity: " << v2.capacity() << endl;
  cout << "Vector v3 size: " << v3.size() << endl;
  cout << "Vector v3 capacity: " << v3.capacity() << endl;


  cout << endl << "Accessing the values in a vector:" << endl;
  // The following is UNSAFE.  DO NOT DO THIS AT HOME!!!
  cout << "  Using array indexing: ";  
  for (unsigned int ii=0; ii<v1.capacity()+10;ii++) {
    cout << v1[ii] << ", ";
  }
  cout << endl;

  // The following is a safe way to access values in a vector.
  cout << "  Using at() : ";
  //for (unsigned int ii=0; ii<v1.capacity()+10;ii++) {
  for (unsigned int ii=0; ii<v1.size();ii++) {
    cout << v1.at(ii) << ", ";
  }
  cout << endl;

  // The following is safer - using an iterator
  cout << "  Using an iterator : ";
  for (vector<int>::iterator ii = v1.begin(); ii != v1.end(); ii++) {
    cout << (*ii) << ", ";
  }
  cout << endl;

  // You can also use a for-each loop
  cout << "  Using a for-each loop : ";
  for (auto& ii : v1) {
    cout << ii << ", ";
  }
  cout << endl << endl;

  v1[4] = 5; 
  cout << "v1[4] = 5: " << endl;
  cout << "Vector v1 size: " << v1.size() << endl;
  cout << "Vector v1 capacity: " << v1.capacity() << endl;
  for (unsigned int ii=0; ii<v1.capacity();ii++) {
    cout << v1[ii] << ", ";
  }
  cout << endl;
  cout << "v1.push_back(6) " << endl;
  v1.push_back(6);
  cout << "Vector v1 size: " << v1.size() << endl;
  cout << "Vector v1 capacity: " << v1.capacity() << endl;
  for (unsigned int ii=0; ii<v1.capacity();ii++) {
    cout << v1[ii] << ", ";
  }
  cout << endl;

  cout << endl << "Calling push_back when initialized with an array " << endl;
  v2.push_back(40);
  v2.push_back(50);
  v2.push_back(60);
  cout << "Vector v2 size: " << v2.size() << endl;
  cout << "Vector v2 capacity: " << v2.capacity() << endl;
  for (unsigned int ii=0; ii<v2.size();ii++) {
    cout << v2.at(ii) << ", ";
  }
  cout << endl;
  
  cout << endl << "Calling push_back on an uninitialized vector " << endl;
  v3.push_back(-1);
  v3.push_back(-2);
  v3.push_back(-3);
  cout << "Vector v3 size: " << v3.size() << endl;
  cout << "Vector v3 capacity: " << v3.capacity() << endl;
  for (unsigned int ii=0; ii<v3.size();ii++) {
    cout << v3.at(ii) << ", ";
  }
  cout << endl;
 
   
  cout << "Adding 10 elements to v1: " << endl;
  for (int ii=0;ii<10;ii++) {
    v1.push_back(ii+10);
  }
  cout << "Vector v1 size: " << v1.size() << endl;
  cout << "Vector v1 capacity: " << v1.capacity() << endl;
  for (unsigned int ii=0; ii<v1.capacity();ii++) {
    cout << v1[ii] << ", ";
  }
  
 
  cout << "Print contents using a for-each loop" << endl;
  for (auto& ii : v1) {
    cout << ii << ", ";
  }
  cout << endl;


  v1[4] = 5; 
  cout << "v1[4] = 5: " << endl;
  cout << "Vector v1 size: " << v1.size() << endl;
  cout << "Vector v1 capacity: " << v1.capacity() << endl;
  for (unsigned int ii=0; ii<v1.capacity();ii++) {
    cout << v1[ii] << ", ";
  }
  cout << endl;
  cout << "v1.push_back(6) " << endl;
  v1.push_back(6);
  cout << "Vector v1 size: " << v1.size() << endl;
  cout << "Vector v1 capacity: " << v1.capacity() << endl;
  for (unsigned int ii=0; ii<v1.capacity();ii++) {
    cout << v1[ii] << ", ";
  }
  cout << endl;

  cout << endl << "Calling push_back when initialized with an array " << endl;
  v2.push_back(40);
  v2.push_back(50);
  v2.push_back(60);
  cout << "Vector v2 size: " << v2.size() << endl;
  cout << "Vector v2 capacity: " << v2.capacity() << endl;
  for (unsigned int ii=0; ii<v2.size();ii++) {
    cout << v2.at(ii) << ", ";
  }
  cout << endl;
  
  cout << endl << "Calling push_back on an uninitialized vector " << endl;
  v3.push_back(-1);
  v3.push_back(-2);
  v3.push_back(-3);
  cout << "Vector v3 size: " << v3.size() << endl;
  cout << "Vector v3 capacity: " << v3.capacity() << endl;
  for (unsigned int ii=0; ii<v3.size();ii++) {
    cout << v3.at(ii) << ", ";
  }
  cout << endl;
 
   
  cout << "Adding 10 elements to v1: " << endl;
  for (int ii=0;ii<10;ii++) {
    v1.push_back(ii+10);
  }
  cout << "Vector v1 size: " << v1.size() << endl;
  cout << "Vector v1 capacity: " << v1.capacity() << endl;
  for (unsigned int ii=0; ii<v1.capacity();ii++) {
    cout << v1[ii] << ", ";
  }
  cout << endl << endl << "Removing 3 elements from v:" << endl;
  cout << "                         Before : ";
  printVector(v1);
  v1.erase(v1.begin());
  cout << "          Removed first element : ";
  printVector(v1);
  v1.erase(v1.begin()+3);
  cout << "            Removed 4th element : ";
  printVector(v1);
  v1.erase(v1.end()-1); 
  cout << "           Removed last element : ";
  printVector(v1);
  v1.erase(v1.end()-3); 
  cout << "    Removed 3rd to last element : ";
  printVector(v1);
  v1.erase(v1.begin(), v1.begin() + v1.size() / 2); 
  cout << "             Removed first half : ";
  printVector(v1);


  cout << endl << "Print front & back and pop_back of v3: " << endl;
  cout << " v3 front: " << v3.front() << endl;
  cout << " v3 back: " << v3.back() << endl;
  cout << " v3 pop_back: " << endl;
  v3.pop_back();
  cout << "  Final contents of v3: ";
  for (auto& ii : v3) {
    cout << ii << ", ";
  }
  cout << endl;

  // Sorting a vector
  cout << endl << "Sorting a vector:" << endl << " Before : ";
  for (auto& ii : v4) {
    cout << ii << ", ";
  }
  cout << endl;
  sort(v4.begin(), v4.end());    
  cout << "  After : ";
  for (auto& ii : v4) {
    cout << ii << ", ";
  }
  cout << endl;



  return 0;
}

template<typename T>
void printVector(vector<T> vec) {
  for (auto& ii : vec) {
    cout << ii << ", ";
  }
  cout << endl;
}
