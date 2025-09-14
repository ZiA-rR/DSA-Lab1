#include <iostream>
#include <vector>
using namespace std;
vector<int> arr={1,2,3,4,5,6,7,8,9,10};
int main(){
arr.push_back(11);
arr.insert(arr.begin()+5,20);
for(int i:arr){
    cout<<i<<"\n";   
}
return 0;
}