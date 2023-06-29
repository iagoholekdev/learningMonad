package javaMonad;

import java.util.function.Function;

public class monad<T> {
    private T value;

    private monad(T value) {
        this.value = value;
    }

    public static <T> monad<T> unit(T value) {
        return new monad<>(value);
    }

    public <R> monad<R> bind(Function<T, monad<R>> func) {
        return func.apply(value);
    } 

    public T getValue() {
        return value;
    }

    public static void main(String[] args) {
        monad<Integer> valueMonad = monad.unit(2);
        monad<Integer> resultMonad = valueMonad.bind(value -> monad.unit(value + 1))
                                               .bind(value -> monad.unit(value * 2))
                                               .bind(value -> monad.unit(value - 2));

        System.out.println(resultMonad.getValue());
    }
}
