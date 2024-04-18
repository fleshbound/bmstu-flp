(defun get_roots (a b c)
  (let ((discr (- (* b b) (* 4 (* a c))))
	(a2 (* 2 a)))
    (cond ((= a 0) (cond ((= b 0) (cond ((= c 0) 'INF_ROOTS)
					(T 'ERROR_DATA)))
			 (T (cons 'LINEAR (cons (/ (- a c) b) Nil)))))
	  ((< discr 0) (cons (cons (/ (- b) a2) (/ (sqrt (abs discr)) a2)) (cons (cons (/ (- b) a2) (* -1 (/ (sqrt (abs discr)) a2))) Nil)))
	  (T (cons (/ (- (- b) (sqrt discr)) a2) (cons (/ (+ (- b) (sqrt discr)) a2) Nil)))
    )
  )
)


(fiveam:test test_1
  (fiveam:is (equal (get_roots 0 0 0) 'INF_ROOTS)))

(fiveam:test test_2
  (fiveam:is (equal (get_roots 0 0 1) 'ERROR_DATA)))

(fiveam:test test_3
  (fiveam:is (equal (get_roots 0 1 1) '(LINEAR -1))))

(fiveam:test test_4
  (fiveam:is (equal (get_roots 1 1 0) '(-1.0 0.0))))

(fiveam:test test_5
  (fiveam:is (equal (get_roots 1 0 -1) '(-1.0 1.0))))

(fiveam:test test_6
  (fiveam:is (equal (get_roots 1 0 1) '((0 . 1.0) (0 . -1.0))))))

(fiveam:run!)
