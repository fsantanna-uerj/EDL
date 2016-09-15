local $pre = '';

sub smart_print {
    my $v = shift;
    print "$pre) $v\n";
}

sub cap1 {
    local $pre = $pre."1.";
    smart_print("frase 1 em cap.1");
    cap11();
    smart_print("frase 2 em cap.1");
    cap12();
    smart_print("frase 3 em cap.1");
}

sub cap11 {
    local $pre = $pre."1.";
    smart_print("frase 1 cap.1.1");
    smart_print("frase 2 cap.1.1");
}

sub cap12 {
    local $pre = $pre."2.";
    smart_print("frase 1 cap.1.2");
    smart_print("frase 2 cap.1.2");
}

smart_print("frase global");
cap1();
cap2();
