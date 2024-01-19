mmember(X, [X|_]).
mmember(X, [_|Y]) :- mmember(X, Y).

% mmember(1, X).

% this isn't right: I want to be able to do add(X, Y, 42).
add(N, 0, N).
add(N, M, Result) :-
  B is M - 1,
  A is N + 1,
  add(A, B, Result).

% works forward, but not backward:
increment_fs([], []).
increment_fs([H|T], [H1|T1]) :-
  H1 is H + 1,
  increment_fs(T, T1).

% works backward, but not forward:
increment_bs([], []).
increment_bs([H|T], [H1|T1]) :-
  H is H1 - 1,
  increment_bs(T, T1).

% does both. what is this black magic?
increment([], []).
increment([H|T], [H1|T1]) :-
  nonvar(H),             % H is instantiated
  !,                     % cut to prevent backtracking once H is known to be instantiated
  H1 is H + 1,           % increment H to get H1
  increment(T, T1).
increment([H|T], [H1|T1]) :-
  var(H),                % H is not instantiated (so H1 should be)
  H is H1 - 1,           % deduce H from H1
  increment(T, T1).
