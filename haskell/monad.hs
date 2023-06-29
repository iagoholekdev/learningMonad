-- Function to divide two numbers
divide :: Double -> Double -> Maybe Double
divide _ 0 = Nothing
divide x y = Just (x / y)

-- Function to calculate the square root of a number
sqrtMaybe :: Double -> Maybe Double
sqrtMaybe x
  | x < 0     = Nothing
  | otherwise = Just (sqrt x)

-- Function to calculate half of a number
half :: Double -> Maybe Double
half x = Just (x / 2)

-- Function to calculate half of the inverse of the square root of a number
calculation :: Double -> Maybe Double
calculation x = do
  y <- sqrtMaybe x
  z <- divide 1 y
  half z

-- Example usage
main :: IO ()
main = do
  let result1 = calculation 2 -- Result: Just 1.0
      result2 = calculation (-4) -- Result: Nothing

  putStrLn $ "Result 1: " ++ show result1
  putStrLn $ "Result 2: " ++ show result2
