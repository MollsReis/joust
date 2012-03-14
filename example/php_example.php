<?php
class Handler {
    public function subtract($a, $b) {
        return $a - $b;
    }
    public function subtract_named($a) {
        return $a['minuend'] - $a['subtrahend'];
    }
    public function update($a, $b, $c, $d, $e) {
        return null;
    }
    public function foobar() {
        return null;
    }
    public function sum($a, $b, $c) {
        return $a + $b + $c;
    }
    public function notify_hello($a) {
        return null;
    }
    public function get_data() {
        return array('hello', 5);
    }
    public function notify_sum($a, $b, $c) {
        return null;
    }
}