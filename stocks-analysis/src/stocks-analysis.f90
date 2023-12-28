module stocks_analysis
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, stocks-analysis!"
  end subroutine say_hello
end module stocks_analysis
