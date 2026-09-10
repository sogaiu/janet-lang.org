# getproto works for tables

(def tab @{:b 2})
# when no prototype table, returns nil
(getproto tab) # -> nil

(def tproto @{:a 1})
(table/setproto tab tproto)
# same prototype table is returned
(= (getproto tab) tproto) # -> true

# getproto also works for structs

(def st1 {:b 2})
# when no prototype struct, returns nil
(getproto st1) # -> nil

(def sproto {:a 1})
(def st2 (struct/with-proto sproto ;(flatten (kvs st1))))
# same prototype struct is returned
(= (getproto st2) sproto) # -> true
