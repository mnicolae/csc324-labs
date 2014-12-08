student(bob).
student(lily).
student(mihai).
student(ella).

teacher(david).
teacher(yashar).

teaching(david, csc324).
teaching(yashar, csc458).

taking(lily, csc324).
taking(mihai, csc458).
taking(ella, csc324).

friends(bob, ella).
friends(bob, lily).
friends(ella, lily).

% Is lily a friend of both bob and ella?
% friends(lily, bob), friends(lily, ella).

% Is anyone a friend of both bob and ella?
% friends(X, bob), friends(X, ella).

% Are there two people who are friends?
% friends(X, Y).

% Are there two people who are taking the same course?
% taking(X, Z), taking(Y, Z).

% Are there two people who are friends, and who are taking the same course?
% friends(X, Y), taking(X, Z), taking(Y, Z).

happy(X) :- taking(X, csc324).

busy(X) :- teaching(X, csc324).
busy(X) :- taking(X, csc324).

busy(X) :- teaching(X, _).
busy(X) :- taking(X, _).

trio(X, Y, Z) :- friends(X, Y), friends(X, Z), friends(Y, Z).

team([lily, bob, ella]).
pair([X, Y]) :- friends(X, Y).

onlyHello([hello]). 
onlyHappy([X]) :- happy(X).
onlyHappy2([X,Y]) :- happy(X), happy(Y).
onlyHappy3([X,_,_]) :- happy(X).
onlyHappy3([_,X,_]) :- happy(X).
onlyHappy3([_,_,X]) :- happy(X).

