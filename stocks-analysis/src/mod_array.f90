module mod_array
    implicit none
    
    private
    public :: reverse, average, moving_average, moving_std, std, variance
contains
    pure function reverse(array)
        real, intent(in) :: array(:)
        real :: reverse(size(array))
        reverse = array(size(array):1:-1)
    end function reverse

    pure real function average(x)
        real, intent(in) :: x(:)
        average = sum(x) / size(x)
    end function  average

    pure real function variance(x)
        real, intent(in) :: x(:)
        variance = average(x - average(x))**2
    end function variance

    pure real function std(x)
        real, intent(in) :: x(:)
        ! std = sqrt(variance(x))
        std = sqrt(average((x - average(x))**2))
    end function std

    pure function moving_average(x, w)
        real, intent(in) :: x(:)
        integer, intent(in) :: w ! moving window
        real :: moving_average(size(x))
        integer :: i, lb

        do i = 1, size(x)
            lb = max(i-w, 1) ! on s'assure que i-w >= 1
            moving_average(i) = average(x(lb:i))
        end do
    end function moving_average

    pure function moving_std(x, w)
        real, intent(in) :: x(:)
        integer, intent(in) :: w ! moving window
        real :: moving_std(size(x))
        integer :: i, lb

        do i = 1, size(x)
            lb = max(i-w, 1) ! on s'assure que i-w >= 1
            moving_std(i) = std(x(lb:i))
        end do
    end function moving_std
end module mod_array