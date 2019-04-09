father(ruwee, padme).
father(anakin, luke).
father(anakin, leia).
father(han, ben).
mother(jobal, padme).
mother(shmi, anakin).
mother(padme, luke).
mother(padme, leia).
mother(leia, ben).
alias(darthvader, anakin).
alias(luke, skywalker).
alias(X,Y) :- alias(Y, X).     % not a great rule - avoid circular logic!

% male/1
male(luke).
male(john).
male(bob).
male(mike).
female(sarah).
% weather/3
weather(tempe, summer, hot).
weather(tempe, winter, warm).
weather(tempe, fall, hot).
weather(newyork, summer, warm).
weather(seattle, summer, cool).
weather(buenasaires, winter, warm).
weather(sydney, fall, hot).
weather(yellowknife, fall, cold).
% weather/2
weather(City, Temp) :- weather(City, _Season, Temp).
% warmcity/1
warmcity(City) :- weather(City, _, warm).
warmcity(City) :- weather(City, fall, hot).

avg_temp(berlin, 49).
avg_temp(karlsruhe, 60).
avg_temp(paris, 55).
avg_temp(belgrade, 52).
avg_temp(chicago, 50).
avg_temp(boston, 48).
avg_temp(johannesburg, 55).
avg_temp(phoenix, 80).
avg_temp(jerusalem, 61).

% calculate average temperature in Celsius
avg_temp_celsius(City, C_temp) :-        % head of the rule
			avg_temp(City, F_temp),   % get the avg temp of the City
			C_temp is round((F_temp - 32) * 5 / 9).

play_outside(City) :- avg_temp_celsius(City, Temp), Temp < 20.

colder_than(City1, City2) :- 
	            avg_temp(City1, Temp1),
	            avg_temp(City2, Temp2),
                Temp1 < Temp2.

% To check equality, use the same variable name
same_temp(City1, City2) :-
                avg_temp(City1, Temp),
                avg_temp(City2, Temp),
				City1 \= City2.

president(washington).
president(lincoln).
president(kennedy).
president(obama).
president(captainmarvel).
president(X) :- member(X,[adams, jefferson, fdr]).

score(phillies,4).
score(nationals,3).
score(rays, 5).
score(whitesox, 1).
% This is not a good rule!
won(X) :- score(X, ScoreX), score(_Y, ScoreY), ScoreX > ScoreY.

happy(bob).
happy(alice).
talkative(bob).
annoying(jarjar).
annoying(gnats).
annoying(X) :- talkative(X), happy(X).

% Robot AI
badguy(darthvader).       % badguy/1
badguy(darthsidious).
badguy(kyloren).
badguy(batman, twoface).  % badguy/2
badguy(batman, joker).
badguy(superman, lexluthor).
fight(X) :- badguy(X).
fight(X) :- badguy(_,X).
fight(X) :- annoying(X).  % poor bob!
fight(alice).             % poor alice!
fight(_).                 % poor anybody!


num(X) :- member(X,[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]).

% equation A + B = C
equation(A,B,C) :- num(A), num(B), C is A + B.
