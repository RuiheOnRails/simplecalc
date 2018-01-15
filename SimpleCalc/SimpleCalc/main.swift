//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let isInt: Bool = Int(args[args.count - 1]) == nil ? false : true;
        if(isInt){
            if(args.count == 3){
                let op = args[1]
                switch op {
                case "+": return Int(args[0])! + Int(args[2])!
                case "-": return Int(args[0])! - Int(args[2])!
                case "*": return Int(args[0])! * Int(args[2])!
                case "/":return Int(args[0])! / Int(args[2])!
                case "%" : return Int(args[0])! % Int(args[2])!
                default: return 0
                }
            }else {
                return 0;
            }
        }else{
            if(args.count == 1){
                return 0;
            }else{
                var mutableArgsDup = args
                let op = mutableArgsDup.removeLast()
                switch op{
                case "count": return args.count - 1
                case "avg": return avg(mutableArgsDup)
                case "fact": return fact(args)
                default: return 0
                }
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
    
    public func avg(_ args: [String]) -> Int {
        var ret: Int = 0
        for arg in args{
            let num = Int(arg)
            if(num != nil){
                ret += num!
            }else{
                return 0
            }
        }
        return ret/args.count
    }
    
    public func fact(_ args: [String]) -> Int {
        var num = Int(args[0])
        if( num != nil){
            for i in ( 1..<num!){
                num! *= i
            }
            return num!
        }else{
            return num!
        }
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

