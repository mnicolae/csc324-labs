% Lab 8 - Planning trips in Prolog

% plane(A,B) means it is possible to travel directly from A to B on a plane.
% boat(A,B) means it is possible to travel directly from A to B on a boat.
plane(toronto, ny).
plane(toronto, vancouver).
plane(ny, london).
plane(london, bombay).
plane(london, oslo).
plane(vancouver, tokyo).
plane(bombay, katmandu).
boat(oslo, stockholm).
boat(stockholm, bombay).
boat(bombay, maldives).
boat(vancouver, tokyo).


% cruise(A, B) -- there is a possible boat journey from A to B.
cruise(A, B) :- boat(A, B).
cruise(A, B) :- boat(A, Z), cruise(Z, B).


% trip(A, B) -- there is a possible journey (using plane or boat) from
% A to B.
trip(A, B) :- boat(A, B).
trip(A, B) :- plane(A, B).
trip(A, B) :- boat(A, Z), trip(Z, B). 
trip(A, B) :- plane(A, Z), trip(Z, B). 

% plane_cruise(A, B) -- there is a trip from A to B that has at least
% one plane leg, and at least one boat leg.
plane_cruise(A, B) :- plane(A, C), boat(C, D).
plane_cruise(A, B) :- plane(A, C), boat(C, D), trip(D, B).

plane_cruise(A, B) :- boat(A, C), plane(C, D).
plane_cruise(A, B) :- boat(A, C), plane(C, D), trip(D, B).

% boat_tour(A, B, Places) -- there is a *boat* trip from A to B that
% goes through the places in List, in that order.
boat_tour(A, B, []) :- boat(A, B).
boat_tour(A, B, [P]) :- boat(A, P), boat(P, B).
boat_tour(A, B, [PL1, PL2|PL]) :- boat(A, PL1), boat(PL1, PL2), boat_tour(PL2, B, PL).

% tour(A, B, Places) -- there is a trip from A to B that goes
% through the places in Places, in that order.
tour(A, B, []) :- trip(A, B).
tour(A, B, [P]) :- trip(A, P), trip(P, B).
tour(A, B, [PL1, PL2|PL]) :- trip(A, PL1), trip(PL1, PL2), tour(PL2, B, PL).

% short_trip(A, B, N) -- there is a trip from A to B that goes
% through at most N places.
short_trip(A, B, 0) :- trip(A, B).
% TODO: add recursive step

