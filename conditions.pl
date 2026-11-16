student(ali).
passed(ali).
failed(ahmed).


topper(X) :-
student(X), passed(X).

happy(X) :- 
passed(X) ; rich(X).

safe(X) :- 
student(X), \+ failed(X).