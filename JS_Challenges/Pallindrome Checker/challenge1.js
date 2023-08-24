"use strict";

// function to check whether the passed argument was a alphabet or not
const isAAlphabet = chr => {
    if((chr >= 'a' && chr <= 'z') || (chr >= 'A' && chr <= 'Z')) return true;
    else return false;
}

// function to check whether the passed argument was a number or not
const isANumber = chr => {
    if(chr >= '0' && chr <= '9') return true;
    else return false;
}

// function to check if a passed argument was an Alpha-Numeric character or not

const isAlphaNumeric = chr => isAAlphabet(chr) || isANumber(chr);

// function to check whether the passed argument was a pallindrome or not
// Assumptons
// 1) the passed argument was an string
// 2) should only consider Alpha-Numeric characters
// 3) the characters in the string are case-insensitive
function palindrome(str){
    // i traverses from left end and j traverses from the right end
    let i=0,j=str.length-1;

    while((i<=j) && (i<str.length && j>=0)){
        
        // Alpha-Numeric check for the left side character 
        if(!isAlphaNumeric(str[i])){
            // skip the current caracter if it fails the check
            i++;
            continue; 
        }

        // Alpha-Numeric check for the left side character 
        if(!isAlphaNumeric(str[j])){
            // skip the current caracter if it fails the check
            j--;
            continue;
        }

        // similarity check for the both side characters
        const leftChr = str[i].toUpperCase();
        const rightChr = str[j].toUpperCase();
        if(leftChr != rightChr)  return false;
        
        i++; // move towards right
        j--; // move towards left
    }
    return true;

}

// test cases 
// 1) palindrome("eye") should return a boolean
// 2) palindrome("eye") should return true
// 3) palindrome("_eye") should return true
// 4) palindrome("race car") should return true
// 5) palindrome("not a palindrome") should return false
// 6) palindrome("A man, a plan, a canal. Panama") should return true
// 7) palindrome("never odd or even") should return true
// 8) palindrome("nope") should return false
// 9) palindrome("almostomla") should return false
// 10) palindrome("My age is 0, 0 si ega ym.") should return true
// 11) palindrome("1 eye for of 1 eye.") should return false
// 12) palindrome("0_0 (: /-\ :) 0-0") should return true
// 13) palindrome("five|\_/|four") should return false

// 24-08-2023 all test cases were passed