# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"

p statement.count('t')      #string.count
p statement.scan('t').count # array.count

p statement.scan('t') #=> ["t", "t"]

