#include <iostream>
using namespace std;

// Function declaration
int add(int a, int b);

// Function definition (from utilities.cpp)
int add(int a, int b) { 
    return a + b; 
}

int main() {
    cout << "add(2,3) == 5: " << (add(2,3) == 5 ? "PASS" : "FAIL") << endl;
    return 0;
}
