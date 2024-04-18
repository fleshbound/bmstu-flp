(defun append2 (x y)
  (cond ((null x) y)
	(T (cons (car x) (append2 (cdr x) y))))
  )

(trace append2)

(append2 '(1 2) '(3 4))

(reverse '(1 2 3))

(defun last1 (l)
  (cond ((Null l) Nil)
	((Null (cdr l)) (car l))
	(T (last1 (cdr l))))
  )

(last1 Nil)

(defun reverse1 (l)
  (cond ((Null l) Nil)
	(T (append (reverse1 (cdr l)) (cons (car l) Nil)))))

(reverse1 '(1 2 3))

(defun append3 (&rest args)
  (cond ((Null args) Nil)
	(T (append2 (car args) (append3 (cdr args))))))

(trace append3)

(append3 '(1 2) '(3 4) '(5 6))

(equal '(1 2 (1 2 (1 2))) '(1 2 (1 2 (1 2 3))))

(cdr '((1 . 2) (1 . 2) (1 . 2) (1 . 2)))

; 1

(setf lst1 '(a b c))

(setf lst2 '(d e))

(cons lst1 lst2)

(append lst1 lst2)

; 2

(reverse '(a b c))

(reverse '(a b (c (d))))

(reverse '(a))

(reverse Nil)

(reverse '((a b c)))

(last '(a b c))

(last '(a b (c)))

(last '(a))

(last ())

(last '((a b c)))

; 3

(defun last1 (l)
  (cond ((Null l) Nil)
	((Null (cdr l)) (cons (car l) Nil))
	(T (last1 (cdr l))))
  )

(last1 '(a b c))

(defun last2 (l)
  (cond ((Null l) Nil)
	(T (cons (car (reverse l)) Nil)))
  )

(last2 '(a b c))

; 4

(defun withoutlast1 (l)
  (cond ((Null l) Nil)
	(T (reverse (cdr (reverse l)))))
  )

(withoutlast1 '(a b c))

(defun withoutlast2 (l)
  (cond ((Null l) Nil)
	(T (remove (car (last l)) l)))
  )

(withoutlast2 '(a b c))

(defun withoutlast3 (l)
  (cond ((Null l) Nil)
	((Null (cdr l)) Nil)
	(T (cons (car l) (withoutlast3 (cdr l)))))
  )

(defun withoutlast4 (l)
  (cond ((Null l) Nil)
	((Null (cdr l)) Nil)
	(T (withoutlast4 (cdr l))))
  )  

(withoutlast3 '(a b c))

; 5

(defun swap-first-last1 (l)
  (cond ((Null l) Nil)
	(T (cons (cons (cons (cons (car (last l)) Nil) (reverse (cdr (reverse l)))) Nil) (cons (car l) Nil))))
  )

(defun swap-first-last2 (l)
  (cond (())
    )
  )

(swap-first-last1 '(a b c))

(car Nil)


(defun swap-first-last (l)
  (cond ((Null l) Nil)
	(T (append (last l)
		   (append (cdr (withoutlast3 l))
			   (cons (car l) Nil)))))
  )

(swap-first-last '(a b c d e))

; 6

(setf *random-state* (make-random-state T))

(defun play (str)
  (let* ((dice (cons (+ (random 6) 1) (+ (random 6) 1)))
	 (d1 (car dice))
	 (d2 (cdr dice))
	 (sum (+ d1 d2)))
    (print str)
    (print dice)
    (cond ((= sum 7) Nil)
	  ((= sum 11) Nil)
	  ((= d1 1) (cond ((= d2 1) (play str))
			  (T sum)))
	  ((= d1 6) (cond ((= d2 6) (play str))
			  (T sum)))
	  (T sum))
    )
  )

(defun game ()
  (let ((sum1 (play "FIRST")))
    (cond ((Null sum1) (print "FIRST WINS"))
	  (T (let ((sum2 (play "SECOND")))
	       (cond ((Null sum2) (print "SECOND WINS"))
		     (T (cond ((< sum1 sum2) (print "SECOND WINS"))
			      ((> sum1 sum2) (print "FIRST WINS"))
			      (T (print "DRAW"))
			      ))
		     )
	       ))
	  )
    )
  )

(game)

; 7

(defun palindrom (l)
  (cond ((Null l) Nil)
	((Null (cdr l)) T)
	((equal (car (last l)) (car l)) (palindrom (reverse (cdr (reverse (cdr l))))))
	)
  )

(untrace palindrom)

(palindrom '(a b a))

; 8

(setf table '(("Russia" . "Moscow")
	      ("England" . "London")
	      ("USA" . "Washington")
	      ("France" . "Paris")))

(defun getcountry (capital table)
  (cond ((Null table) Nil)
	((equal capital (cdr (car table))) (car (car table)))
	(T (getcountry capital (cdr table)))
	)
  )

(getcountry "Paris" table)

(defun getcapital (country table)
  (cond ((Null table) Nil)
	((equal country (car (car table))) (cdr (car table)))
	(T (getcapital country (cdr table)))
	)
  )

(getcapital "France" table)

; 9
; a

(defun mult1 (n l)
  (cons (* n (car l))
	(cdr l))
  )

(mult1 3 '(1 2 3))

; b

(defun mult2 (n l)
  (cond ((numberp (car l)) (cons (* n (car l)) (cdr l)))
	(T (cons (car l) (mult2 n (cdr l))))
	)
  )

(mult2 5 '(a b 2 b 2 3))

(setf l '(a b c))

(setf ls (last l))

(rplaca ls 'a)

(print l)

(defun get_roots (a b c)
  (let ((D (- (* b b) (* 4 a c)))
	(a2 (* 2 a)))
    (cond ((= a 0) (cond ((= b 0) (cond ((= c 0) 'INF_ROOTS)
					(T 'ERROR_DATA)))
			  (T (cons 'LINEAR (cons (/ (- a c) b) Nil)))
			  ))
	  ((< D 0) (let ((DSA (sqrt (abs D))))
		     (cons (cons (/ (- b) a2) (/ DSA a2)) (cons (cons (/ (- b) a2) (- (/ DSA a2))) Nil)) 
		     ))
	  (T (let ((DS (sqrt D)))
	       (cons (/ (- (- b) DS) a2) (cons (/ (+ (- b) DS) a2) Nil))))
	  )	  
    )
  )

(get_roots 0 0 0)
