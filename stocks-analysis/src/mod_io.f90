module mod_io
    use mod_alloc, only: alloc, free
    implicit none
    
    private
    public :: read_stocks, write_stock
contains 

integer function num_records(filename)
    character(*), intent(in) :: filename
    integer :: fileunit
    num_records = 0

    open(newunit=fileunit, file=filename)
    do 
        read(fileunit, fmt=*, end=1)
        num_records = num_records + 1
    end do

    1 continue
    close(fileunit)
    end function num_records

subroutine read_stocks(filename, time, open_, high, low, close_, adjclose, volume)
    character(*), intent(in) :: filename
    character(:), allocatable, intent(inout) :: time(:)
    real, dimension(:), allocatable, intent(inout) :: open_, high, low, close_, adjclose, volume
    integer :: fileunit, n, nm

    nm = num_records(filename) - 1 ! - 1 pour ignorer l'en-tête

    if (allocated(time)) deallocate(time)
    allocate(character(len=10) :: time(nm))
    call alloc(open_, nm)
    call alloc(high, nm)
    call alloc(low, nm)
    call alloc(close_, nm)
    call alloc(adjclose, nm)
    call alloc(volume, nm)

    open(newunit=fileunit, file=filename)
    read(fileunit, fmt=*, end=1)  ! Saute l'en-tête
    do n = 1, nm
        read(fileunit, fmt=*, end=1) time(n), open_(n), high(n), low(n), close_(n), adjclose(n), volume(n)
        
    end do
    1 close(fileunit)  ! Fortran utilise le 1 s'il rencontre une exception dans 'read'
end subroutine read_stocks
    
subroutine write_stock(filename, time, price, mvavg, mvstd)
    character(len=*), intent(in) :: filename
    character(len=:), allocatable, intent(in) :: time(:)
    real, dimension(:), intent(in) :: price, mvavg, mvstd
    integer :: fileunit, n
    open(newunit=fileunit, file=filename)
    do n = 1, size(time)
      write(fileunit, fmt=*) time(n), price(n), mvavg(n), mvstd(n)
    end do
    close(fileunit)
  end subroutine write_stock 

end module mod_io