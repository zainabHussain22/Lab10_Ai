
% Sample user dataset
user(ahmed, 1234).
user(sara, 5678).
user(ali, 1111).

% Start login with 3 attempts
login :-
    check_login(3).

% No attempts remaining
check_login(0) :-
    write('Sorry, you exceeded the maximum number of attempts, try again later.'),
    nl.

% Check username and password
check_login(Attempts) :-
    Attempts > 0,
    write('Enter username: '),
    read(Username),
    write('Enter password: '),
    read(Password),
    (
        user(Username, Password)
    ->
        write('Login Successful'), nl
    ;
        write('Login Unsuccessful'), nl,
        Remaining is Attempts - 1,
        check_login(Remaining)
    ).
