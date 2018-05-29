//
//  SimpleProgram.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 5/18/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation


func factorialWithoutRecursion(number : Int) -> Int {
    
    var num = 1
    for index in 1...number {
        
        num = num * index
    }
    return num
}


func factorialWithRecursion(number : Int) -> Int {
    
    if number < 1 {
        return 1
    }
    
    return number * factorialWithRecursion(number: number - 1)
}

//two ways to do this
//iterative
//recursive
func febnacciNumber(number : Int) -> Int {
    
    if number == 0 {
        
        return 0
    }
    else if number == 1  {
        return 1
    }
    else {
        return febnacciNumber(number: number - 1) + febnacciNumber(number: number - 2)
    }
}

func febnacciNumberWithIterative(number : Int) -> [Int] {

     var arr = [Int]()
    
    if number == 0 {
        
        arr[0] = 0
    }
    else if number == 1  {
         arr[1] = 1
    }
    else {
    
        for number in 2..<number {
        
              arr[number] = arr[number - 1] + arr[number - 2]
        }
    }
    return arr
}


//{0, -1, 2, -3, 1};

func findThreeNumberWithSumZero(arr : [Int]) {
    
    var found = false
    let count = arr.count - 1
    for number in 0..<count {
        
        var l = number + 1
        var r = count
        var x = arr[number]
        
        while (l < r)
        {
            if (x + arr[l] + arr[r] == 0)
            {
                print("found")
                found = true
                l = l + 1
                r = r - 1
            }// If sum of three elements is less
                // than zero then increment in left
            else if (x + arr[l] + arr[r] < 0){
                l = l + 1
            }
            // if sum is greater than zero than
            // decrement in right side
            else {
                r = r - 1;
            }
           
        }
        
    }
    if (found == false) {
        
        print("not found")
    }
}

func squareroot(number: Double) -> Double {
    
    if number <= 0 {
        return 0
    }
    
    var x = number / 3   //10/3 ==3.3333
    var y = number / x    // 3.0
    let maxDiff: Double = 0.0001
    
    while abs(y - x) > maxDiff {
        x = (x + y) / 2
        y = number / x
    }
    
    return x
}

let squreroot = squareroot(number: 9000000)
//print("squreroot = ", squreroot)


//Output:
//squreroot =  3000.00000000004
// while loop is executed only 14 times for a value of 9000000.


func knapSack(weight : Int, weightArr : [Int], valueArr : [Int], count : Int) {
    
    var i : Int = 0
    var w : Int = 0
    
    
    
    for index in 0...count {
       
        for subIndex in 0...weight {
            
            
        }
    }
    
    
}


func bucketSort(data : [Int],reverse: Bool = false) -> [Int] {
   
    
    guard data.count > 0 else { return [] }
    
    let max = data.max()!
    var buckets = [Int](repeating: 0, count: (max + 1))
    var out = [Int]()
    
    for i in 0..<data.count {
        buckets[data[i]] = buckets[data[i]] + 1
    }
    
    buckets.enumerated().forEach { index, value in
        guard value > 0 else { return }
        
        out.append(contentsOf: [Int](repeating: index, count: value))
    }
    
    return reverse == true ? out.reversed() : out
}
//

/*
extension Array where Element == Int {
    func bucketSort(reverse: Bool = false) -> [Element] {
        var data = self
        
        guard data.count > 0 else { return [] }
        
        let max = data.max()!
        var buckets = [Int](repeating: 0, count: (max + 1))
        var out = [Int]()
        
        for i in 0..<data.count {
            buckets[data[i]] = buckets[data[i]] + 1
        }
        
        buckets.enumerated().forEach { index, value in
            guard value > 0 else { return }
            
            out.append(contentsOf: [Int](repeating: index, count: value))
        }
        
        return reverse == true ? out.reversed() : out
    }
}
*/
//

//func int knapSack(int W, int wt[], int val[], int n)
//{
//    int i, w;
//    int K[n+1][W+1];
//
//    // Build table K[][] in bottom up manner
//    for (i = 0; i <= n; i++)
//    {
//        for (w = 0; w <= W; w++)
//        {
//            if (i==0 || w==0)
//            K[i][w] = 0;
//            else if (wt[i-1] <= w)
//            K[i][w] = max(val[i-1] + K[i-1][w-wt[i-1]],  K[i-1][w]);
//            else
//            K[i][w] = K[i-1][w];
//        }
//    }
//
//    return K[n][W];
//}



