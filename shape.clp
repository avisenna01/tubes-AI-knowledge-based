; function
(defrule get_number_of_angle
=>
(printout t "masukkan jumlah sudut! ")
(bind ?response (read))
(assert(no_angle ?response))
)

(defrule getSisiSudutSegitiga
(shape-is segitiga)
=> 
(printout t "masukkan sudut dan sisi dengan format a1 a2 an d1 d2 ")
(bind ?a1 (read))
(bind ?a2 (read))
(bind ?a3 (read))
(bind ?d1 (read))
(bind ?d2 (read))
(bind ?d3 (read))
(assert(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3)))
)
(defrule getSisiSudutSegiEmpat
(shape-is segiempat)
=> 
(printout t "masukkan sudut dan sisi dengan format a1 a2 an d1 d2 ")
(bind ?a1 (read))
(bind ?a2 (read))
(bind ?a3 (read))
(bind ?a4 (read))
(bind ?d1 (read))
(bind ?d2 (read))
(bind ?d3 (read))
(bind ?d4 (read))
(assert(segiempat (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4)))
)

(defrule getSisiSudutSegilima
(shape-is segilima)
=> 
(printout t "masukkan sudut dan sisi dengan format a1 a2 an d1 d2 ")
(bind ?a1 (read))
(bind ?a2 (read))
(bind ?a3 (read))
(bind ?a4 (read))
(bind ?a5 (read))
(bind ?d1 (read))
(bind ?d2 (read))
(bind ?d3 (read))
(bind ?d4 (read))
(bind ?d5 (read))
(assert(segilima (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (a5 ?a5) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4) (d5 ?d5)))
)

(defrule getSisiSudutSegienam
(shape-is segienam)
=> 
(printout t "masukkan sudut dan sisi dengan format a1 a2 an d1 d2 ")
(bind ?a1 (read))
(bind ?a2 (read))
(bind ?a3 (read))
(bind ?a4 (read))
(bind ?a5 (read))
(bind ?a6 (read))
(bind ?d1 (read))
(bind ?d2 (read))
(bind ?d3 (read))
(bind ?d4 (read))
(bind ?d5 (read))
(bind ?d6 (read))
(assert(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (a5 ?a5) (a6 ?a6) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4) (d5 ?d5) (d6 ?d6)))
)
; template 
(deftemplate segitiga
    (slot a1)
    (slot a2)
    (slot a3)
    (slot d1)
    (slot d2)
    (slot d3))
(deftemplate segiempat
    (slot a1)
    (slot a2)
    (slot a3)
    (slot a4)
    (slot d1)
    (slot d2)
    (slot d3)
    (slot d4))
(deftemplate segilima
    (slot a1)
    (slot a2)
    (slot a3)
    (slot a4)
    (slot a5)
    (slot d1)
    (slot d2)
    (slot d3)
    (slot d4)
    (slot d5)
    )

(deftemplate segienam
    (slot a1)
    (slot a2)
    (slot a3)
    (slot a4)
    (slot a5)
    (slot a6)
    (slot d1)
    (slot d2)
    (slot d3)
    (slot d4)
    (slot d5)
    (slot d6))

; menentukan bentuk

(defrule isSegitiga
(no_angle 3) => (assert(shape-is segitiga)))

(defrule isSegiEmpat
(no_angle 4 )=> (assert(shape-is segiempat)))

(defrule isSegiLima
(no_angle 5) => (assert(shape-is segilima)))

(defrule isSegiEnam
(no_angle 6) => (assert(shape-is segienam)))

; segitiga

(defrule segitigaLancip
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test (and (< ?a1 90) (and (< ?a2 90) (< ?a3 90)))) 
=>
(assert (tipe-is segitigaLancip)))

(defrule segitigaTumpul
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test (or (> ?a1 90) (or (> ?a2 90) (> ?a3 90)))) 
=>
(assert (tipe-is segitigaTumpul)))

(defrule segitigaSiku
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test (or (= ?a1 90) (or (= ?a2 90) (= ?a3 90)))) 
=>
(assert (tipe-is segitigaSiku)))

(defrule segitigaSamaSisi
(shape-is segitiga)
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(not (tipe-is segitigaSiku))
(not (tipe-is segitigaTumpul)) 
(test(and (= ?d1 ?d2) (= ?d2 ?d3)))
=>
(assert(tipe-is segitigaSamaSisi))
)

(defrule segitigaSamaKakiLancip
(shape-is segitiga)
(tipe-is segitigaLancip)
(not (tipe-is segitigaSamaSisi)) 
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test(or(and (= ?d1 ?d2) (<> ?d2 ?d3)) (or(and (= ?d1 ?d3) (<> ?d2 ?d1)) (and (= ?d2 ?d3) (<> ?d1 ?d3)) )))
=>
(assert(tipe-is segitigaSamaKakiLancip))
)

(defrule segitigaSamaKakiTumpul
(shape-is segitiga)
(tipe-is segitigaTumpul)
(not (tipe-is segitigaSamaSisi)) 
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test(or(and (= ?d1 ?d2) (<> ?d2 ?d3)) (or(and (= ?d1 ?d3) (<> ?d2 ?d1)) (and (= ?d2 ?d3) (<> ?d1 ?d3)) )))
=>
(assert(tipe-is segitigaSamaKakiTumpul))
)

(defrule segitigaSamaKakiSiku
(shape-is segitiga)
(tipe-is segitigaSiku)
(not (tipe-is segitigaSamaSisi)) 
(test(or(and (= ?d1 ?d2) (<> ?d2 ?d3)) (or(and (= ?d1 ?d3) (<> ?d2 ?d1)) (and (= ?d2 ?d3) (<> ?d1 ?d3)) )))
(test(and (= ?d1 ?d2) (and (= ?d1 ?d3) (<> ?d2 ?d3))))
=>
(assert(tipe-is segitigaSamaKakiSiku))
)

;segiempat
;segilima
(defrule segilimaSamaSisi
(shape-is segilima)
(segilima (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (a5 ?a5) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4) (d5 ?d5))
(test(and (= ?d1 ?d2) (and(= ?d2 ?d3) (and (= ?d3 ?d4) (= ?d4 ?d5)))))
=>
(assert (shape-is segienamSamaSisi))
)
;segienam  
(defrule segienamSamaSisi
(shape-is segienam)
(segilima (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (a5 ?a5) (a6 ?a6) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4) (d5 ?d5) (d6 ?d6))
(test(and (= ?d1 ?d2) (and(= ?d2 ?d3) (and (= ?d3 ?d4) (and(= ?d4 ?d5)(= ?d5 ?d6))))))
=>
(assert (shape-is segienamSamaSisi))
)