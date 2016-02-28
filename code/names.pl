while(<>) {
  @_ = split;
  print "$_[1], $_[0]\n";
}
