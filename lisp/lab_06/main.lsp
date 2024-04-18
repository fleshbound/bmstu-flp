					; 1
(defun _my-reverse (lst res)
  (cond ((null lst) res)
	(T (_my-reverse (cdr lst)
			(cons (car lst)
			      res)))))

(defun my-reverse (lst)
  (_my-reverse lst Nil))

(my-reverse '(1 2 3 (1 2) 2))
					; 2
(defun first-list-elem (lst)
  (cond ((null lst) Nil)
	((listp (car lst)) (car lst))
	(T (first-list-elem (cdr lst)))))

(first-list-elem '(1 2 (1 2) 3 4 (1)))

(first-list-elem Nil)

(defun nb (lst res low high)
  (cond ((null lst) res)
	((and (numberp (car lst))
	      (or (< low (car lst) high)
		  (< high (car lst) low))) (nb (cdr lst) (cons (car lst) res) low high))
	((atom (car lst)) (nb (cdr lst) res low high))
	(T (nb (cdr lst)
	       (nb (car lst) res low high)
	       low
	       high))))

(defun numbers-between (lst low high)
  (my-reverse (nb lst Nil low high)))

(trace nb)

(numbers-between '(4 2 1 5 7 3 2) 0 3)

					; 4
(defun mult-n (n l)
  (cond ((numberp (car l)) (cons (* n (car l))
				 (cdr l)))
	(T (cons (car l)
		 (mult-n n (cdr l))))))

(defun mult-non (n lst res)
  (cond ((null lst) res)
	((numberp lst) (* n lst))
	(T (mult-non

(defun mult (n lst)
  (mult-non n lst Nil))

(mult 10 '(1 (1 (1)) 2 3))

(defun mult2 (n l)
  (cond ((numberp (car l)) (cons (* n (car l)) (cdr l)))
	(T (cons (car l)
		 (mult2 n (cdr l))))))

(defun mult_2 (n lst res)
  (cond ((null lst) res)
	((numberp lst) )))

(defun mult-a (n lst res)
  (cond ((null lst) res)
	(T (mult-a n (cdr lst) (cons (* n (car lst)) res)))))

(defun m-a (n lst)
  (mult-a n lst Nil))

(defun mb (n lst res)
  (cond ((null lst) res)
	((numberp (car lst)) (mb n (cdr lst) (append res (cons (* (car lst) n) Nil))))
	((atom (car lst)) (mb n (cdr lst) (append res (cons (car lst) Nil))))
	(T (mb n (cdr lst) (append res (cons (mb n (car lst) Nil) Nil))))))

(defun mult-b (n lst)
  (mb n lst Nil))

(trace mb)

(mult-b 10 '(1 (1 2) 2))

(trace mult-a)

(m-a 10 '(1 2 3))

(>= 10 10)

(defun ra (lst res)
  (cond ((null lst) res)
	((numberp (car lst)) (ra (cdr lst) (+ (car lst) res)))
	((atom (car lst)) (ra (cdr lst) res))
	(T (+ (ra (cdr lst) res)
	      (ra (car lst) res)))))

(defun rec-add (lst)
  (ra lst 0))

(rec-add '(1 2 (1 2) a))

(defun rnth (n lst cur)
  (cond ((null lst) Nil)
	((= n cur) (car lst))
	(T (rnth n (cdr lst) (+ cur 1)))))

(defun recnth (n lst)
  (rnth n lst 0))

(recnth 3 '(1 2 3))

(defun aldd (lst res)
  (cond ((null lst) res)
	((null res) res)
	((and (numberp (car lst)) (oddp (car lst))) (aldd (cdr lst) (and T)))))

















(defun insert (el lst)
  (cond ((null lst) (cons el Nil))
	((>= el (car lst)) (cons (car lst) (insert el (cdr lst))))
	(T (cons el lst))))

(defun sort-into-one (lst res)
  (cond ((null lst) res)
	((atom lst) (insert lst res))
	(T (sort-into-one (car lst)
			  (sort-into-one (cdr lst) res)))))

(defun mysort (lst)
  (sort-into-one lst Nil))

(defvar lst '(4 3 (2 (1))))

(fiveam:test sort-test-1
  (fiveam:is (equalp '(1 2 3 4) (mysort lst))))

(fiveam:test sort-test-2
  (fiveam:is (equalp Nil (mysort Nil))))
(fiveam:test sort-test-1
  (fiveam:is (equalp '(1 2 3 4) (mysort lst)))
(fiveam:test sort-test-3
  (fiveam:is (equalp '(1 2 3) (mysort '(2() 3 (1))))))

(fiveam:test sort-test-4
  (fiveam:is (equalp '(1) (mysort '(1)))))

(fiveam:run!)
