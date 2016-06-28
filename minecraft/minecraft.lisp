(clear-all)

(define-model minecraft-test

(sgp :jni-hostname "127.0.0.1" :jni-port 5555 :jni-sync t)
(sgp :v t :esc t :trace-detail high)

;;; CHUNKS AND CHUNK-TYPES
(chunk-type do-minecraft state)

(add-dm
	;; State chunks
	(start ISA chunk)
	(end ISA chunk)
		
	;; Goal chunks
	(goal ISA do-minecraft state start))

(goal-focus goal)

;;; PRODUCTIONS
(p do-random
	=goal>
		ISA do-minecraft
		state start
	?manual>
		state free
	==>
	+manual>
		cmd	press-key
		key "a"
	=goal>
		state end)

(p go-back
	=goal>
		ISA do-minecraft
		state end
	==>
	=goal>
		state start)
)