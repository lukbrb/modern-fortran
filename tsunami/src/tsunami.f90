module tsunami
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, tsunami!"
  end subroutine say_hello
end module tsunami
