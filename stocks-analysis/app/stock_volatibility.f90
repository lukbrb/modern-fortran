program stock_volatibility
    use mod_array, only: moving_average, moving_std, reverse, std, average
    use mod_io, only: read_stocks, write_stock
    implicit none
    
    integer :: n, im
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
        im = size(time)

        if (n == 1) then
            print *, time(im) // ' through ' // time(1)
            print *, 'Symbol, Average (USD), Volatility (USD), Relative Volatility (%)'
            print *, '----------------------------------------------------------------'
        end if
        
        print *, symbols(n), average(adjclose), std(adjclose), nint(std(adjclose) / average(adjclose) * 100)
        
        time = time(im:1:-1)
        call write_stock('data/' // trim(symbols(n)) // '_volatility.txt', time, adjclose,&
        moving_average(adjclose, 30), moving_std(adjclose, 30))
        
    end do

end program stock_volatibility