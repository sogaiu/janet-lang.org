(thaw-keep-keys "str") # -> @"str"
(thaw-keep-keys @"buf") # -> @"buf"
(thaw-keep-keys 'sym) # -> 'sym
(thaw-keep-keys :kwd) # -> :kwd

(thaw-keep-keys [:ant [:bee]]) # -> @[:ant @[:bee]]
(thaw-keep-keys @["hi" nil]) # -> @[@"hi" nil]

(thaw-keep-keys {:a {:b 2}}) # -> @{:a @{:b 2}}
(thaw-keep-keys @{[:x :y] [0 {:a "hi"}]}) # -> @{[:x :y] @[0 @{:a @"hi"}]}

(def key [:hi])
(def value [0 {:a ["hi" 1]}])
(def tab @{key value})
(def thawed (thaw-keep-keys tab))
(def new-key (first (keys thawed)))
# dictionary key was unchanged
(= new-key key) # -> true

(thaw-keep-keys nil) # -> nil
(thaw-keep-keys true) # -> true
(thaw-keep-keys 2.71828) # -> 2.71828
