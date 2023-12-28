program stock_gain
  use mod_io, only: read_stocks
  use mod_array, only: reverse
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

    adjclose = reverse(adjclose)
    gain = (adjclose(size(adjclose)) - adjclose(1))
    print *, symbols(n), gain, nint(gain / adjclose(1) * 100)
  end do


end program stock_gain
