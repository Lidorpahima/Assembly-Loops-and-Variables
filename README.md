<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assembly: Loops and Variables</title>
</head>
<body>
    <h1>Assembly: Loops and Variables</h1>
    <p>This repository contains several Assembly language programs that demonstrate the use of loops and variables. The programs are designed to solve specific problems using Assembly language on x86 architecture.</p>

    <h2>Programs</h2>

    <h3>1. Find the Maximum Three-Digit Number</h3>
    <p>This program searches for and stores the largest three-digit number in an array of unsigned words. The array and its size are given in the data segment. The result is stored in a variable named <code>Max</code>.</p>
    <p><strong>Example:</strong></p>
    <pre>
Array dw 100, 6, 35, 250, 18, 1000, 180
sz dw 7
    </pre>
    <p>After execution, the value of <code>Max</code> will be <code>250</code>.</p>

    <h3>2. Sort Array by Digit Count</h3>
    <p>This program sorts an array of unsigned bytes such that two-digit numbers come first, followed by single-digit numbers, and finally three-digit numbers. The array and its size are given in the data segment.</p>
    <p><strong>Example:</strong></p>
    <pre>
Vec db 1, 18, 255, 6, 49, 48, 3, 254, 7
N dw 9
    </pre>
    <p>After execution, the array <code>Vec</code> will be:</p>
    <pre>
Vec db 18, 49, 48, 6, 1, 3, 7, 254, 255
    </pre>

    <h3>3. Copy First and Last Words from String</h3>
    <p>This program copies the first and last words from a source string to a destination string. The special character <code>$</code> indicates the end of the string.</p>
    <p><strong>Example:</strong></p>
    <pre>
str1 db "London is the capital of Great Britain.$"
str2 db 20 dup(?)
    </pre>
    <p>After execution, the value of <code>str2</code> will be:</p>
    <pre>
str2 = "London Britain.$"
    </pre>

    <h2>How to Run</h2>
    <ol>
        <li>Assemble the code using an assembler like <code>MASM</code> or <code>TASM</code>.</li>
        <li>Link the object file to create an executable.</li>
        <li>Run the executable in an environment that supports x86 Assembly language.</li>
    </ol>

    <h2>Files</h2>
    <ul>
        <li><code>max_three_digit.asm</code>: Program to find the maximum three-digit number.</li>
        <li><code>sort_by_digits.asm</code>: Program to sort the array by digit count.</li>
        <li><code>copy_first_last_words.asm</code>: Program to copy the first and last words from a string.</li>
    </ul>

    <h2>License</h2>
    <p>This project is licensed under the MIT License - see the <a href="LICENSE">LICENSE</a> file for details.</p>
</body>
</html>
