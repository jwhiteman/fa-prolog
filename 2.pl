% set filetype=prolog
% consult('2.pl').
%
reigns(rhodri, 844, 878).
reigns(anarawd, 878, 916).
reigns(hywel_dda, 916, 950).
reigns(iago_ap_idwal, 950, 979).
reigns(hywel_ap_ieuaf, 979, 985).
reigns(cadwallon, 985, 986).
reigns(maredudd, 986, 999).

prince(X, Y) :-
  reigns(X, A, B),
  Y >= A,
  Y =< B.

% prince(cadwallon, 986).
% prince(rhodri, 1979).
% prince(X, 900).
% prince(X, 979).

role(ceo, nadella, microsoft, 2014, 2023).
role(ceo, ballmer, microsoft, 2000, 2014).
role(ceo, gates, microsoft, 1975, 2000).
role(ceo, cook, apple, 2011, 2023).
role(ceo, jobs, apple, 1997, 2011).
role(ceo, spindler, apple, 1993, 1996).

ceo(N, C, Y) :-
  role(ceo, N, C, S, E),
  Y >= S,
  Y =< E.

% ceo(X, Y, 2012).
% => X:ballmer Y:microsoft
%    X:cook Y:apple

pop(usa, 203).
pop(india, 548).
pop(china, 800).
pop(brazil, 108).
area(usa, 3).
area(india, 1).
area(china, 4).
area(brazil, 3).

density(X, Y) :-
  pop(X, P),
  area(X, A),
  Y is P / A.

% density(china, X).
% density(turkey, X).
