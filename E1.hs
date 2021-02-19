-- "Хоть и коментарии загрязнюят код и усложняет его ревью, но чтобы понять и разобраться нужны."
{- №1
    (7.03^(1-sqrt 4.92))/(3*4.92-tg(7.03))
	x = 7.03, y = 4.92;
	(x**(1-sqrt y))/(3*y-tan(x))
-}
solveFun x y = x**(1-sqrt y)/(3*y-tan x)
-- $ solveFun 7.03 4.92
-- > 0.00671984452001409

{- №2
    «Если разница между максимальным и минимальным элементами списка [1,2,3,4,5] нечетна, 
	то третий элемент этого списка не равен минимальному».
-}
compareFun l = odd (maximum l - minimum l) == (l !! 3 /= minimum l)
-- $ compareFun [1,2,3,4,5]
-- > False

{- №4
	snd (3,5) : init [1,2,3,4,5] == [5,1,2,3,4]
-}
{-	"Описание:
	snd (3,5) - Берем второй элемент кортежа. (5)
	init [1,2,3,4,5]	- удаляем последний элемент кортежа, и получим [1,2,3,4].
	: 	- И присоединяем элемент к списку, [5] и [1,2,3,4], получим [5,1,2,3,4]
	== 	- Сравнивание двух кортежей, True."
-}

{- №3 
	Функцию myexpr(определив самостоятельно тип и необходимое число аргументов), 
	позволяющую вычислить выражение из задания 1. Убедитесь в равенстве ответов. 
	Продемонстрируйте работу функции при каких-нибудь 3 наборах аргументов, отличных 
	от начальных (в задание 1).  
-}
--"Условно сделал это со всеми задачами, но чтобы не забыть написал коментарии."

{- №5
	Заменяет в заданном списке-строке все вхождения заданного символа на другой заданный 
	символ.
-}
replaceFun :: Eq a => [a] -> a -> a -> [a]
replaceFun [] _ _ = []
replaceFun (x:xs) element1 element2 
            | x == element1 = element2 : replaceFun xs element1 element2
            | otherwise     = x : replaceFun xs element1 element2
-- $ replaceFun "hello world" 'l' '$'
-- > "he$$o wor$d"

{- №6
	Определите функции для вычисления чисел Фибоначчи  по номеру и для вычисления
	факториала. С помощью них определите собственную функцию, записанную в условной
	математической нотации. (fib(n)  - означает n-е число Фибоначчи).
-}
fib 1 = 1
fib 2 = 1
fib n = fib (n-1) + fib (n-2)

fact 1 = 1
fact n = n*fact (n-1)
-- $ fact 2 - fib 5 
-- > -3
-- $ fact 3 - fib 5
-- > 1

choiceFun n m 
	| odd nm 			 = fact n - fib m
    | otherwise = let k  = nm `div` 2 in fib k - fact k
	where nm= n+m
-- $ choiceFun 2 5
-- > -3
-- $ choiceFun 3 5
-- > -21