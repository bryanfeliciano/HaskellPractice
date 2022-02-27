-- f x y = x + y

-- checkDigit::[Int]->[Int]
-- checkDigit []=[]
-- checkDigit [x]=[x]
-- checkDigit (x:y:xs)= [x,y]

---homework #1---

---section 1---

---[char]->int ---input is a list of character and outputs integer---
---int-> bool  ---inputs integer and outputs boolean (true or false statement)---
---int->char->bool ---two inputs one is int,one is char and the output of both of them is a boolean---
---(list)[a]->a->(list)[a]->a ---this is a way to make sure your function can be polymorphic,since the type isnt specified it can technically be any type---
---a->a->[a]->a polymorphic a with 3 inputs one of which is a list of a that outputs a ---
---[[a]]->[a] list of list a outputs list of a---
---a->[a]->[a] input of a and list that outputs a list of a---
---int->[a->int] takes in an int and an a within a list that outputs a value of int appended to the list---

---section #2---
---find out the differences--

---Int->Int->Int---takes in Ints and outputs Int---
---(Int,Int)->Int ---inputs a tuple f ints and outputs a single int---
---[int]->int ---Integer within a list as an input and int as a output---

---section #3---
---find the difference= all of these are exactly the same ,theyre using currying---

---Int->Int->Int --- 2 integer inputs and 1 integer output---
---Int->(Int,Int)--- input on integer and integer within a tuple with an output of an integer within a tuple---
---(Int->Int)->Int --- input of integers within tuple with an output of integer---