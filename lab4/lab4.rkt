;cs381;
;lab4;
;Wei Huang;
;huangwei@oregonstate.edu;

;reference: https://docs.racket-lang.org/guide/intro.html;
#lang racket
(define (f lst)
 ; (a) ;
 (if (null? lst)
      ; (b) ;
     '()
      ; (c) ;
      (cons (+ 1 (car lst)) (f (cdr lst)))))
  ;(f '(3 1 4 1 5 9));
  ;Self-Check Questions;
    ;Question 1: Run this function as follows. What output do you get?;
    ;output:'(4 2 5 2 6 10);
    ;Question 2: What does this function f do?;
    ; I think it is a conditional function. If the list is an empty that print empty, otherwise print the list.;
    ;Question 3: Give a comment that explains the line following (a), (b), and (c).;
    ;This is a conditional for (if test-expr(a) then-expr(b) else-expr(c)).The (a) is always evaluated. If it produces is #f,then (b) is evaluated. Otherwise (C) is evaluated.;
    ;Question 4: Trace the call given in Question 1, showing each recursive call to the function.;
    ;Expand the term lst to specific lists or atoms at each depth of the recursion.;
    ;1st = (3 1 4 1 5 9),2nd = (1 4 1 5 9),3th = (4 1 5 9), 4th = (1 5 9),5th = (5 9),6th = (9),7th = ();

;member function;
;get the example that check if the element in the list. If the element in the list is true, if not is false.;
;reference:https://www.cs.bham.ac.uk/research/projects/poplog/paradigms_lectures/lecture5.html;
(define (member? e lst)
;if the list empty is false;
    (cond
      ((null? lst) #f)
    ;element in list is true;
      ((equal? e (car lst)) #t)
      (else    (member? e (cdr lst)))))
;(member? 2 '(4 2 3));


;set function;
(define (set? lst)
;empty list is true;
  (cond
    ((null? lst) #t)
    ;first element as the element of member function, compare with cdr list. If first element in the list equal the cdr list that there is  duplicates.;
    ((member? (car lst) (cdr lst)) #f)
    ;if there is no duplicates, check the cdr lst;
    (else (set? (cdr lst)))
  )
)
;(set? '(2 3 4 5 2));


;Union function;
;reference: https://stackoverflow.com/questions/49775765/merge-with-no-duplicates;
(define (union lst1 lst2)
  (cond
  ;lst1 is empty return lst2, lst2 is empty return lst1;
    ((null? lst1) lst2)
    ;lists are not empty;
    ;compare the fist element in lst1 with lst2;
    ((member? (car lst1) lst2)
    ;call the union function continue compare;
       (union (cdr lst1) lst2))
    (else
    ;union the lst1 and lst2
      (union (cdr lst1) (cons (car lst1) lst2) )
    )
  )
)

;(union '(1 2 8) '(5 6 2) );


;intersect function;
;reference:https://stackoverflow.com/questions/41869337/scheme-two-lists-intersection;
(define (intersect lst1 lst2)
;lst1 is empty, return empty;
  (if (null? lst1)
    '()
    ;check the first element in lst1 intersection with lst2;
    (if (member? (car lst1) lst2)
        ;check cdr lst1 intersect with lst2;
        (cons (car lst1) (intersect (cdr lst1) lst2))
        (intersect (cdr lst1) lst2)
    )
  )
)
;(intersect '(1 2 3 4 5) '(5 4 3 2 1));


;difference function;
(define (difference lst1 lst2)
  ;if lst1 is empty, return empty;
  (if(null? lst1)
    '()
    ;check the first element of lst1 compare with lst2 is not duplicates;
    (if (not(member? (car lst1) lst2))
      (cons (car lst1) (difference (cdr lst1) lst2))
      (difference (cdr lst1) lst2)
    )
  )
)
;(difference '(2 3 4 5) '(2 3));

;test;
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))
