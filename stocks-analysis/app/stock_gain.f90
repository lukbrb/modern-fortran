program stock_gain
  use stocks_analysis, only: say_hello
  use mod_io, only: read_stocks
  implicit none

  integer :: n
  character(4), allocatable :: symbols(:)
  character(len=:), allocatable :: time(:)
  real, allocatable :: open(:), high(:), low(:), close(:), adjclose(:), volume(:)
  real :: gain


  symbols = ['AAPL', 'AMZN', 'CRAY', 'CSCO', 'HPQ ', &
             'IBM ', 'INTC', 'MSFT', 'NVDA', 'ORCL']
  do n = 1, size(symbols)
    print *, "Working on ", symbols(n)
    call read_stocks('data/' // trim(symbols(n)) // '.csv', &
                    time, open, high, low, close, adjclose, volume)

    gain = -(adjclose(size(adjclose)) - adjclose(1))
    print *, symbols(n), gain, nint(gain / adjclose(size(adjclose)) * 100)
  end do


end program stock_gain
