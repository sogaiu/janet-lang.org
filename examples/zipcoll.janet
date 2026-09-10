(zipcoll "x" "y") # -> @{120 121}
(zipcoll 'if 'do) # -> @{102 111 105 100}
(zipcoll :a :xy) # -> @{97 120}

(zipcoll [:a] [1]) # -> @{:a 1}
(zipcoll @[:x :y] @[0]) # -> @{:x 0}
(zipcoll @[:x] [0 1]) # -> @{:x 0}

(zipcoll (coro (yield :a)) (coro (yield 1))) # -> @{:a 1}

(zipcoll [:a] (coro (yield :1))) # -> @{:a :1}
