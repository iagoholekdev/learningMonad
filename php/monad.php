<?php

class Monad
{
    private $value;

    private function __construct($value)
    {
        $this->value = $value;
    }

    public static function unit($value)
    {
        return new self($value);
    }

    public function bind($func)
    {
        return $func($this->value);
    }

    public function getValue()
    {
        return $this->value;
    }
}

function incrementValue($value)
{
    return Monad::unit($value + 1);
}

function decrementValue($value)
{
    return Monad::unit($value - 1);
}
function doubleValue($value)
{
    return Monad::unit($value * 2);
}

$valueMonad = Monad::unit(2);
$resultMonad = $valueMonad
                ->bind('incrementValue')
                ->bind('doubleValue')
                ->bind('decrementValue');

echo $resultMonad->getValue();

?>
