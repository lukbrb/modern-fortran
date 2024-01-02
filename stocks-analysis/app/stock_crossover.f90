program stock_crossover
    use mod_array, only: crossneg, crosspos, reverse
    use mod_io, only: read_stocks, write_stock
    implicit none
    
    integer :: i, n, fileunit
    character(4), allocatable :: symbols(:)
    character(len=:), allocatable :: time(:)
    integer, allocatable :: buy(:), sell(:)
    real, allocatable :: open(:), high(:), low(:), close(:), adjclose(:), volume(:)
    real :: gain
  
  
    symbols = ['AAPL', 'AMZN', 'CRAY', 'CSCO', 'HPQ ', &
               'IBM ', 'INTC', 'MSFT', 'NVDA', 'ORCL']
    do n = 1, size(symbols)
        print *, "Working on ", symbols(n)
        call read_stocks('data/' // trim(symbols(n)) // '.csv', &
                        time, open, high, low, close, adjclose, volume)

        adjclose = reverse(adjclose)

        buy = crosspos(adjclose, 30)
        sell = crossneg(adjclose, 30)

        open(newunit=fileunit, file=trim('data/' // symbols(n)) // '_crossover.txt')
        do i = 1, size(buy)
            write(fileunit, fmt=*) 'Buy ', time(buy(i))
        end do
        do i = 1, size(sell)
            write(fileunit, fmt=*) 'Sell ', time(sell(i))
        end do

        close(fileunit)
    end do
end program stock_crossover