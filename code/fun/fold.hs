l1 = [10,7,4,14,1,6]   -- "10741416"

v1 = foldr (+) 0 l1

v2 = foldr (\atual acuml -> (show atual) ++ acuml) "" l1

main = print v2
