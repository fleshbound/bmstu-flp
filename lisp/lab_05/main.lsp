(defun f (x)
  (let ((n (eval x)))
    (cond ((> n 0) (cond ((oddp n) (+ n 5))
			 (T (+ n 10))))
	  ((< n 0) (- n 5))
	  (T x))))

(defun get-lst (lst)
  (mapcar #'f lst))

(defvar a 1)

(defvar b 0)

(defvar c -1)

(defvar d 2)

(setf lst '(a b c d))

(fiveam:test f_test_1
  (fiveam:is (equal (get-lst lst) '(6 b -6 12))))

(fiveam:test f_test_2
  (fiveam:is (equal (get-lst (list 'a)) '(6))))

(fiveam:test f_test_3
  (fiveam:is (equal (get-lst (list 'c)) '(-6))))

(fiveam:test f_test_4
  (fiveam:is (equal (get-lst (list 'b)) '(b))))

(fiveam:test f_test_5
  (fiveam:is (equal (get-lst (list 'd)) '(12))))

(fiveam:test f_test_6
  (fiveam:is (equal (get-lst (list 'a 'b)) '(6 b))))

(fiveam:run!)
