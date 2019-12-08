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
; function


(defrule getSisiSudutSegitiga
(shape-is segitiga )
(a1 ?a1)
(a2 ?a2)
(a3 ?a3)
(d1 ?d1)
(d2 ?d2)
(d3 ?d3)
=> 
(assert(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3)))
(open "rules.txt" rule "a")
(printout rule "rule getSisiSudutSegitiga" crlf)
(close)
)

(defrule getSisiSudutSegiEmpat
(shape-is segiempat)
(a1 ?a1)
(a2 ?a2)
(a3 ?a3)
(a4 ?a4)
(d1 ?d1)
(d2 ?d2)
(d3 ?d3)
(d4 ?d4)
=> 
(assert(segiempat (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4)))
(open "rules.txt" rule "a")
(printout rule "rule getSisiSudutSegiEmpat" crlf)
(close)
)

(defrule getSisiSudutSegilima
(shape-is segilima)
(a1 ?a1)
(a2 ?a2)
(a3 ?a3)
(a4 ?a4)
(a5 ?a5)
(d1 ?d1)
(d2 ?d2)
(d3 ?d3)
(d4 ?d4)
(d5 ?d5)
=> 
(assert(segilima (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (a5 ?a5) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4) (d5 ?d5)))
(open "rules.txt" rule "a")
(printout rule "rule getSisiSudutSegilima" crlf)
(close)
)

(defrule getSisiSudutSegienam
(shape-is segienam)
(a1 ?a1)
(a2 ?a2)
(a3 ?a3)
(a4 ?a4)
(a5 ?a5)
(a6 ?a6)
(d1 ?d1)
(d2 ?d2)
(d3 ?d3)
(d4 ?d4)
(d5 ?d5)
(d6 ?d6)
=> 
(assert(segienam (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (a5 ?a5) (a6 ?a6) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4) (d5 ?d5) (d6 ?d6)))
(open "rules.txt" rule "a")
(printout rule "rule getSisiSudutSegienam" crlf)
(close)
)
; menentukan bentuk

(defrule isSegitiga
(no_angle 3) => (assert(shape-is segitiga))
(open "rules.txt" rule "a")
(printout rule "rule isSegitiga" crlf)
(close)
)

(defrule isSegiEmpat
(no_angle 4 )=> (assert(shape-is segiempat))
(open "rules.txt" rule "a")
(printout rule "rule isSegiEmpat" crlf)
(close)
)

(defrule isSegiLima
(no_angle 5) => (assert(shape-is segilima))
(open "rules.txt" rule "a")
(printout rule "rule isSegiLima" crlf)
(close)
)

(defrule isSegiEnam
(no_angle 6) => (assert(shape-is segienam))
(open "rules.txt" rule "a")
(printout rule "rule isSegiEnam" crlf)
(close)
)

; segitiga

(defrule segitigaLancip
(shape-is segitiga)
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test (and (< ?a1 90) (and (< ?a2 90) (< ?a3 90)))) 
=>
(assert (tipe-is segitigaLancip))
(open "rules.txt" rule "a")
(printout rule "rule segitigaLancip" crlf)
(close)
)

(defrule segitigaTumpul
(shape-is segitiga)
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test (or (> ?a1 90) (or (> ?a2 90) (> ?a3 90)))) 
=>
(assert (tipe-is segitigaTumpul))
(open "rules.txt" rule "a")
(printout rule "rule segitigaTumpul" crlf)
(close)
)

(defrule segitigaSiku
(shape-is segitiga)
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test (or (= ?a1 90) (or (= ?a2 90) (= ?a3 90)))) 
=>
(assert (tipe-is segitigaSiku))
(open "rules.txt" rule "a")
(printout rule "rule segitigaSiku" crlf)
(close)
)

(defrule segitigaSamaSisi
(shape-is segitiga)
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(not (tipe-is segitigaSiku))
(not (tipe-is segitigaTumpul)) 
(test(= ?d1 ?d2 ?d3))
=>
(assert(tipe-is segitigaSamaSisi))
(open "rules.txt" rule "a")
(printout rule "rule segitigaSamaSisi" crlf)
(close)
)

(defrule segitigaSamaKakiLancip
(shape-is segitiga)
(tipe-is segitigaLancip)
(not (tipe-is segitigaSamaSisi)) 
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test(or(and (= ?d1 ?d2) (<> ?d2 ?d3)) (or(and (= ?d1 ?d3) (<> ?d2 ?d1)) (and (= ?d2 ?d3) (<> ?d1 ?d3)) )))
=>
(assert(tipe-is segitigaSamaKakiLancip))
(open "rules.txt" rule "a")
(printout rule "rule segitigaSamaKakiLancip" crlf)
(close)
)

(defrule segitigaSamaKakiTumpul
(shape-is segitiga)
(tipe-is segitigaTumpul)
(not (tipe-is segitigaSamaSisi)) 
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test(or(and (= ?d1 ?d2) (<> ?d2 ?d3)) (or(and (= ?d1 ?d3) (<> ?d2 ?d1)) (and (= ?d2 ?d3) (<> ?d1 ?d3)) )))
=>
(assert(tipe-is segitigaSamaKakiTumpul))
(open "rules.txt" rule "a")
(printout rule "rule segitigaSamaKakiTumpul" crlf)
(close)
)

(defrule segitigaSamaKakiSiku
(shape-is segitiga)
(tipe-is segitigaSiku)
(not (tipe-is segitigaSamaSisi)) 
(segitiga (a1 ?a1) (a2 ?a2) (a3 ?a3) (d1 ?d1) (d2 ?d2) (d3 ?d3))
(test(or(and (= ?d1 ?d2) (<> ?d2 ?d3)) (or(and (= ?d1 ?d3) (<> ?d2 ?d1)) (and (= ?d2 ?d3) (<> ?d1 ?d3)) )))
=>
(assert(tipe-is segitigaSamaKakiSiku))
(open "rules.txt" rule "a")
(printout rule "rule segitigaSamaKakiSiku" crlf)
(close)
)

(defrule segitigasembarang
(shape-is segitiga)
(not(tipe-is segitigaLancip))
(not(tipe-is segitigaTumpul))
(not(tipe-is segitigaSiku))
(not(tipe-is segitigaSamaSisi))
=>
(assert (tipe-is segitigasembarang))
(open "rules.txt" rule "a")
(printout rule "rule segitigasembarang" crlf)
(close)
)

;segiempat
(defrule jajargenjang
(shape-is segiempat)
(segiempat (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4))
(test(or (or (and(= ?d1 ?d2) (= ?d3 ?d4)) (and(= ?d1 ?d3) (= ?d2 ?d4))) (and(= ?d1 ?d4) (= ?d2 ?d3))))
=>
(assert (tipe-is jajargenjang))
(open "rules.txt" rule "a")
(printout rule "rule jajargenjang" crlf)
(close)
)

(defrule segiempatberaturan
(tipe-is jajargenjang)
(segiempat (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4))
(test(= ?d1 ?d2 ?d3 ?d4))
=>
(assert (tipe-is segiempatberaturan))
(open "rules.txt" rule "a")
(printout rule "rule segiempatberaturan" crlf)
(close)
)

(defrule segiempatlayang
(tipe-is jajargenjang)
(not(tipe-is segiempatberaturan))
=>
(assert (tipe-is segiempatlayang))
(open "rules.txt" rule "a")
(printout rule "rule segiempatlayang" crlf)
(close)
)

(defrule trapesium
(shape-is segiempat)
(not(tipe-is jajargenjang))
=>
(assert(tipe-is trapesium))
(open "rules.txt" rule "a")
(printout rule "rule trapesium" crlf)
(close)
)

(defrule trapesiumsamakaki
(tipe-is trapesium)
(segiempat (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4))
(or(or (test (and(and (= ?a1 ?a2) (= ?a3 ?a4)) (and (not(= ?a1 ?a3)) (not(= ?a2 ?a4)) ) ) ) 
(test (and(and (= ?a1 ?a3) (= ?a2 ?a4)) (and (not(= ?a1 ?a2)) (not(= ?a3 ?a4)) ) ) ))
(test (and(and (= ?a1 ?a4) (= ?a3 ?a2)) (and (not(= ?a1 ?a2)) (not(= ?a3 ?a4)) ) ) )
)
(test(or(or (or (and (= ?d1 ?d2) (not (= ?d3 ?d4))) (and (= ?d1 ?d3) (not (= ?d2 ?d4))) )
(or (and (= ?d1 ?d4) (not (= ?d2 ?d3))) (and (= ?d2 ?d3) (not (= ?d1 ?d4))) ) )
(or (and (= ?d2 ?d4) (not (= ?d1 ?d3))) (and (= ?d3 ?d4) (not (= ?d1 ?d2))) )
)
)
=>
(assert (tipe-is trapesiumsamakaki))
(open "rules.txt" rule "a")
(printout rule "rule trapesiumsamakaki" crlf)
(close)
)

(defrule trapesiumsiku
(tipe-is trapesium)
(not(tipe-is trapesiumsamakaki))
(segiempat (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4))
(test
(or
(or (or(= ?a1 ?a2 90) (= ?a1 ?a3 90)) (or  (= ?a1 ?a4 90)  (= ?a2 ?a3 90)))
(or  (= ?a2 ?a4 90)  (= ?a3 ?a4 90)) ) 
)
=>
(assert (tipe-is trapesiumsiku))
(open "rules.txt" rule "a")
(printout rule "rule trapesiumsiku" crlf)
(close)
)

(defrule segiempatsembarang
(shape-is segiempat)
(not(tipe-is jajargenjang))
(not(tipe-is trapesium))
=>
(assert(tipe-is segiempatsembarang))
(open "rules.txt" rule "a")
(printout rule "rule segiempatsembarang" crlf)
(close)
)

;segilima
(defrule segilimaSamaSisi
(shape-is segilima)
(segilima (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (a5 ?a5) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4) (d5 ?d5))
(test(and (= ?d1 ?d2) (and(= ?d2 ?d3) (and (= ?d3 ?d4) (= ?d4 ?d5)))))
=>
(assert (tipe-is segilimaSamaSisi))
(open "rules.txt" rule "a")
(printout rule "rule segilimaSamaSisi" crlf)
(close)
)

(defrule segilimasembarang
(shape-is segilima)
(not(tipe-is segilimaSamaSisi))
=>
(assert (tipe-is segilimasembarang))
(open "rules.txt" rule "a")
(printout rule "rule segilimasembarang" crlf)
(close)
)
;segienam  
(defrule segienamSamaSisi
(shape-is segienam)
(segienam (a1 ?a1) (a2 ?a2) (a3 ?a3) (a4 ?a4) (a5 ?a5) (a6 ?a6) (d1 ?d1) (d2 ?d2) (d3 ?d3) (d4 ?d4) (d5 ?d5) (d6 ?d6))
(test(and (= ?d1 ?d2) (and(= ?d2 ?d3) (and (= ?d3 ?d4) (and(= ?d4 ?d5) (= ?d5 ?d6)) ) ) ))
=>
(assert (tipe-is segienamSamaSisi))
(open "rules.txt" rule "a")
(printout rule "rule segienamSamaSisi" crlf)
(close)
)

(defrule segienamsembarang
(shape-is segienam)
(not(tipe-is segienamSamaSisi))
=>
(assert (tipe-is segienamsembarang))
(open "rules.txt" rule "a")
(printout rule "rule segienamsembarang" crlf)
(close)
)