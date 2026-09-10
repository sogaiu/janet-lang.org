(thaw "str") # -> @"str"
(thaw @"buf") # -> @"buf"
(thaw 'sym) # -> 'sym
(thaw :kwd) # -> :kwd

(thaw [:ant [:bee]]) # -> @[:ant @[:bee]]
(thaw @["hi" nil]) # -> @[@"hi" nil]

(thaw {:a {:b 2}}) # -> @{:a @{:b 2}}
(thaw @{[:x :y] [0 {:a "hi"}]}) # -> @{@[:x :y] @[0 @{:a @"hi"}]}

(def key [:hi])
(def value [0 {:a ["hi" 1]}])
(def tab @{key value})
(def thawed (thaw tab))
(def new-key (first (keys thawed)))
# dictionary keys changed too
(tuple? key) # -> true
(array? new-key) # -> true
(deep= new-key (array ;key)) # -> true

(thaw nil) # -> nil
(thaw true) # -> true
(thaw 2.71828) # -> 2.71828
